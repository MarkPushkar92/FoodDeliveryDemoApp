//
//  Model.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 23.06.2023.
//

import Foundation

struct MenuObject {
    
    let img: String?
    let name, dsc: String?
    let price: String
    let category: String?
    let imgData: Data?
    
}

enum Category: String, CaseIterable {
    case burgers
    case drinks
    case pizzas
    case sandwiches
    
    static func withLabel(_ label: String) -> Category? {
           return self.allCases.first{ "\($0)" == label }
       }
}
