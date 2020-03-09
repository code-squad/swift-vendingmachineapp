//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var manager = VendingMachineManager()
    private var mainView: MainView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view as? MainView
        mainView.vendingMachineManager = manager
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
    
    func setupMainView() {
        mainView.updateBalanceLabel(amount: manager.balance)
        mainView.updateStockCountLabels(stockList: manager.stockList)
    }
}
