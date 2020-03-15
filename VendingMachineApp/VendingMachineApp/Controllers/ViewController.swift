//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var vendingMachineManager: VendingMachineManager!
    private var vendingMachine: VendingMachine!
    @IBOutlet var addToStockButtons: [UIButton]!
    @IBOutlet var beverageImageViews: [UIImageView]!
    @IBOutlet var berverageStockLabels: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUnarchivingVendingMachine()
        setupUI()
        setupNotification()
    }
    
    private func setupUnarchivingVendingMachine() {
        self.vendingMachine = appDelegate.vendingMachine
        updateUnarchivedBeveragesInfo()
        updateUnarchivedBalance()
    }
    
    private func updateUnarchivedBalance() {
        balanceLabel.text = vendingMachine.balance.description
    }
    
    private func updateUnarchivedBeveragesInfo() {
        vendingMachine.beverageProductions.forEach {
            print("\($0(Date()).name) :", vendingMachine.stock.numberOf($0(Date())))
        }
        
        let stockDictionary = vendingMachine.stockDictionary()
        vendingMachine.forEachProductObjectIdentifier { identifer, index in
            guard let beverages = stockDictionary[identifer] else { return }
            updateLabel(at: index, count: beverages.count())
        }
    }
    
    @IBAction func addToStockButtonTouched(_ button: UIButton) {
        vendingMachine.addToStock(index: button.tag)
    }
    
    @IBAction func putMoneyTouched(_ button: UIButton) {
        vendingMachine.putMoney(button.tag)
    }
    
    @objc private func updateBalanceLabel(_ notification: Notification) {
        guard let balance = notification.userInfo?["balance"] as? Int else { return }
        balanceLabel.text = String(balance)
    }
    
    @objc private func updateStockLabel(_ notification: Notification) {
        vendingMachine.forEachProductObjectIdentifier { identifer, index in
            guard let beverages = notification.userInfo?[identifer] as? Beverages else { return }
            updateLabel(at: index, count: beverages.count())
        }
    }
    
    private func updateLabel(at index: Int, count: Int) {
        berverageStockLabels.forEach {
            guard $0.tag == index else { return }
            $0.text = String(count)
        }
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabel(_:)), name: .StockNumberDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(_:)), name: .BalanceDidChange, object: nil)
    }
    
    private func setupUI() {
        beverageImageViews.forEach {
            $0.layer.cornerRadius = 16
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .BalanceDidChange, object: nil)
        NotificationCenter.default.removeObserver(self, name: .StockNumberDidChange, object: nil)
    }
}
