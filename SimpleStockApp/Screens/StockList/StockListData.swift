//
//  StockData.swift
//  SimpleStockApp
//
//  Created by Harshit Rastogi on 27/01/26.
//

struct StockListData: Codable {
    let success: Bool
    let data: [data]
}
struct data: Codable{
    let sid: String
    let price: Double
}
