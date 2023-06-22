//
//  MainCoordinator.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let tabBarController: TabBarViewController
    private let factory = ControllerFactoryImpl()
    
    init() {
        tabBarController = TabBarViewController()
        let first = firstScreen()
        coordinators.append(first)
        tabBarController.viewControllers = [first.navigation]
        first.start()
        
    }
    
    private func firstScreen() -> FirstScreenCoordinator {
        let navigation = UINavigationController()
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
        
  
        
    
        
        return coordinator
    }
}
