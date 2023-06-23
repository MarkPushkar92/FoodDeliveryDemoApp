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
    let price: Double?
    let category: Category?
    
}

enum Category: String, CaseIterable {
    case burgers
    case drinks
    case pizzas
    case sandwiches
}
