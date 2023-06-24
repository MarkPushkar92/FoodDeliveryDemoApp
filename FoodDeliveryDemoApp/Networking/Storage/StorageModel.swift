//
//  StorageModel.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 24.06.2023.
//

import Foundation
import RealmSwift


class MenuItemCashed: Object {
    @objc dynamic var name: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var price: String?
    @objc dynamic var desc: String?
    @objc dynamic var category: String?
    
    convenience init(name: String?, desc: String?, category: String?, imageData: Data?, price: String?) {
        self.init()
        self.name = name
        self.desc = desc
        self.price = price
        self.imageData = imageData
        self.category = category
    }
}


