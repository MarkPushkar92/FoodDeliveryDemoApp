//
//  MenuModel.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import Foundation



// MARK: - MenuElement
struct MenuElement: Codable {
    let id: String?
    let img: String?
    let name, dsc: String?
    let price: Double?
}

typealias Menu = [MenuElement]


