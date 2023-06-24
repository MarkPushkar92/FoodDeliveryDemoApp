//
//  FirtsScreenViewModel.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

protocol FirstScreenOutput {
    
    var menu: [MenuObject] {get set}
    
    var reloader: (() -> ())? { get }

    func fetchMenu()
    
    func saveToDataBase(object: MenuObject, closure: @escaping (Data?, MenuItemCashed) -> () )
}

final class FirtsScreenViewModel: FirstScreenOutput {
    
    let networkService = NetworkFetcherService()
    
    var reloader: (() -> ())?
        
    var menu = [MenuObject]() {
        didSet {
            if menu.count == 20 {
                guard let reloader = reloader else { return }
                reloader()
            }
        }
        
    }
     
    func fetchMenu()  {
        for category in Category.allCases {
            networkService.fetchDetails(categoty: category) { recievedData in
                if let recievedData = recievedData {
                    StorageManager.deleteAllObjects()
                    for index in 0...4 {
                        let object = recievedData[index]
                        let name = object.name
                        let description = object.dsc
                        let image = object.img
                        let price = String(object.price ?? 0)
                        let menuObject = MenuObject(img: image, name: name, dsc: description, price: price, category: category.rawValue, imgData: nil)
                        self.menu.append(menuObject)
                        self.saveToDataBase(object: menuObject) { (data, item) in
                            item.imageData = data
                            StorageManager.saveObject(item)
                        }
                    }
                } else {
                    let data = realm.objects(MenuItemCashed.self)
                    for object in data {
                        let name = object.name
                        let description = object.desc
                        let image = object.imageData
                        let price = object.price
                        let category = object.category
                        let menuObject = MenuObject(img: nil, name: name, dsc: description, price: price ?? "00", category: category, imgData: image)
                        self.menu.append(menuObject)

                        
                    }
                }
            }
        }
    }
    
    
    func saveToDataBase(object: MenuObject, closure: @escaping (Data?, MenuItemCashed) -> ()) {
        let name = object.name
        let desc = object.dsc
        let price = String(describing: object.price)
        let category = object.category
        guard let url = URL(string: object.img!) else { return }
        
        var imageData: Data?
        DispatchQueue.global().async {
             imageData = try? Data(contentsOf: url)
            let item = MenuItemCashed(name: name, desc: desc, category: category, imageData: nil, price: price)
            DispatchQueue.main.async {
                closure(imageData, item)
            }
        }
      
        
    }
    
}

