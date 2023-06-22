//
//  Coordinator.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import Foundation

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
}
