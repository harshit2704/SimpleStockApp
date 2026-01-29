//
//  DetailsViewController.swift
//  SimpleStockApp
//
//  Created by Harshit Rastogi on 27/01/26.
//

import UIKit

class StockDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var stockData: data?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = stockData?.sid ?? ""
        priceLabel.text = "\(stockData?.price ?? 0.0)"
    }

}
