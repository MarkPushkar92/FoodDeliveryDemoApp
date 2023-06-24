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
        let profile = configureProfile()
        let contacts = configureContacts()
        let basket = configureBasket()
        tabBarController.viewControllers = [first.navigation, contacts, profile, basket ]
        first.start()
        
    }
    
    private func firstScreen() -> FirstScreenCoordinator {
        
        
        let navigation = UINavigationController()
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
          
        let selectedColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
        let image = UIImage.init(named: "main")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let selectedImage = UIImage.init(named: "main")?.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        navigation.tabBarItem = UITabBarItem(title: "Меню", image: image, selectedImage: selectedImage )
        navigation.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
            
        return coordinator
    }
    
    private func configureContacts()  -> UINavigationController {
        let navigation = UINavigationController()
        let selectedColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)

        let image = UIImage.init(named: "pin")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let selectedImage = UIImage.init(named: "pin")?.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        navigation.tabBarItem = UITabBarItem(title: "Контакты", image: image, selectedImage: selectedImage )
        navigation.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)

        return navigation
    }
    
    private func configureProfile()  -> UINavigationController {
        let navigation = UINavigationController()
        let selectedColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)

        let image = UIImage.init(named: "person")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let selectedImage = UIImage.init(named: "person")?.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        navigation.tabBarItem = UITabBarItem(title: "Профиль", image: image, selectedImage: selectedImage )
        navigation.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)

        return navigation
    }
    
    private func configureBasket()  -> UINavigationController {
        let navigation = UINavigationController()
        let selectedColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)

        let image = UIImage.init(named: "Корзина")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let selectedImage = UIImage.init(named: "Корзина")?.withTintColor(selectedColor, renderingMode: .alwaysOriginal)
        navigation.tabBarItem = UITabBarItem(title: "Корзина", image: image, selectedImage: selectedImage )
        navigation.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)

        return navigation
    }
}
