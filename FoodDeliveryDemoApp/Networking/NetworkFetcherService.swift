//
//  NetworkFetcherService.swift
//  FoodDeliveryDemoApp
//
//  Created by Марк Пушкарь on 22.06.2023.
//

import Foundation

class NetworkFetcherService {
    
    private let networkDataFetcher = DataFetcher()
        
    func fetchDetails(categoty: Category ,completion: @escaping (Menu?) -> Void) {
        let urlString = "https://free-food-menus-api-production.up.railway.app/\(categoty.rawValue)"
        networkDataFetcher.fetchData(urlString: urlString, response: completion)
    }
    
    
    
}


