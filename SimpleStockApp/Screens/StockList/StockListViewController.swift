//
//  ViewController.swift
//  SimpleStockApp
//
//  Created by Harshit Rastogi on 27/01/26.
//

import UIKit

class StockListViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    let viewModel = StockListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callApi()
        setupTableView()
        updateData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopApiCall()
    }
    
    func setupTableView(){
        homeTableView.register(UINib(nibName: "StockListTableViewCell", bundle: nil), forCellReuseIdentifier: "StockListTableViewCell")
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    func callApi (){
        viewModel.callStockApi()
    }
    
    func updateData(){
        viewModel.onUpdate = { [weak self] in
            self?.homeTableView.reloadData()
        }
    }
}
extension StockListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.stockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StockListTableViewCell", for: indexPath) as? StockListTableViewCell {
            cell.nameLabel.text = viewModel.stockData[indexPath.row].sid
            cell.priceLabel.text = "\(viewModel.stockData[indexPath.row].price)"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? StockDetailsViewController {
            vc.stockData = viewModel.stockData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

