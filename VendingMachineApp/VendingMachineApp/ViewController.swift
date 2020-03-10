//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var mainView: MainView {
        view as! MainView
    }
    let app = UIApplication.shared.delegate as! AppDelegate

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.vendingMachineManager = app.manager
        NotificationCenter.default.addObserver(self, selector: #selector(moneyChanged), name: NSNotification.Name(rawValue: "MoneyChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stockChanged), name: NSNotification.Name(rawValue: "StockChanged"), object: nil)
        setupMainView()
    }
    
    @objc func moneyChanged(_ notification: Notification) {
        guard let balance = notification.userInfo?["balance"] as? String else { return }
        mainView.updateBalanceLabel(amount: balance)
    }
    
    @objc func stockChanged(_ notification: Notification) {
        guard let stockList = notification.userInfo?["stock"] as? [(key: Beverage, value: Int)] else { return }
        mainView.updateStockCountLabels(stockList: stockList)
    }
    
    private func setupMainView() {
        mainView.updateBalanceLabel(amount: app.manager.balance)
        mainView.updateStockCountLabels(stockList: app.manager.stockList)
    }
}
