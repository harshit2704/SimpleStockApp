//
//  HomeViewModel.swift
//  SimpleStockApp
//
//  Created by Harshit Rastogi on 27/01/26.
//

@MainActor
class StockListViewModel {
    var stockData: [data] = []
    var task: Task<Void, Error>?
    var onUpdate: (()->())?
    
    func callStockApi(){
        task = Task {
            while !(task?.isCancelled ?? true) {
                if let data = try? await NetworkManager.shared.fetchStocks() {
                    stockData = data.data
                    onUpdate?()
                    try? await Task.sleep(nanoseconds: 5_000_000_000)
                }
            }
        }
    }
    func stopApiCall(){
        task?.cancel()
    }
}
