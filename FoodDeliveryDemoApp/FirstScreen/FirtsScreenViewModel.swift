//
//  FirtsScreenViewModel.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

protocol FirstScreenOutput {

}

final class FirtsScreenViewModel: FirstScreenOutput {
    
    let networkService = NetworkFetcherService()
    
    var reloader: (() -> ())?
    
    private var counter = 0
    
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
                    for index in 0...4 {
                        let object = recievedData[index]
                        let name = object.name
                        let description = object.dsc
                        let image = object.img
                        let price = object.price
                        let menuObject = MenuObject(img: image, name: name, dsc: description, price: price, category: category)
                        self.menu.append(menuObject)
                    } 
                }
            }
        }
    }
    
}

