//
//  NetworkManager.swift
//  SimpleStockApp
//
//  Created by Harshit Rastogi on 27/01/26.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchStocks() async throws -> StockListData {
        let url = URL(string: EndPoint.baseUrl.rawValue)
        let (data, _) = try await URLSession.shared.data(from: url!)
        
        return try JSONDecoder().decode(StockListData.self, from: data)
    }
}

