//
//  StorageManager.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 24.06.2023.
//

import Foundation

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ menu: MenuItemCashed) {
        try! realm.write({
            realm.add(menu)
        })
    }
    
    static func deleteObj(_ menu: MenuItemCashed) {
        try! realm.write({
            realm.delete(menu)
        })
    }
    
    static func deleteAllObjects() {
        try! realm.write({
            realm.deleteAll()
        })
    }
}
