//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bananaMilkCount: UILabel!
    @IBOutlet weak var strawberryMilkCount: UILabel!
    @IBOutlet weak var fantaCount: UILabel!
    @IBOutlet weak var topCount: UILabel!
    @IBOutlet weak var hot6Count: UILabel!
    @IBOutlet weak var pepsiCokeCount: UILabel!
    @IBOutlet weak var balance: UILabel!
    lazy var counts = [bananaMilkCount, strawberryMilkCount, fantaCount, topCount, hot6Count, pepsiCokeCount]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vendingMachine = appDelegate.vendingMachine
        refreshDrinkCount()
        refreshBalance()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
    }
    
    private func refreshDrinkCount () {
        let stock = vendingMachine.getStockList()
        let drinkList = SupplyableDrinkList.getSupplyableDrinkList()
        
        for (index, drink) in drinkList.enumerated() {
            counts[index]?.text = String(stock[drink] ?? 0)+"개"
        }
    }
    
    private func refreshBalance () {
        let balance = vendingMachine.getBalance()
        self.balance.text = "\(balance)원"
    }
    
//    private func drinkToLabel(_ drink: Drink) -> UILabel {
//        let supplyableDrinks = SupplyableDrinkList.getSupplyableDrinkList
////        let drinkLabels = [supplyableDrinks[0]: bananaMilkCount]
//
//
//    }

    @IBAction func drinkSupply(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 5 {
            vendingMachine.supply(sender.tag, amount: 1)
        }
    }
    
    @IBAction func insertCoin(_ sender: UIButton) {
        vendingMachine.insertCoin(sender.tag)
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let stock: [Drink : Int] = userInfo["stock"] as! [Drink : Int]
        let drinkList = SupplyableDrinkList.getSupplyableDrinkList()
        
        for (index, drink) in drinkList.enumerated() {
            counts[index]?.text = String(stock[drink] ?? 0)+"개"
        }
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let balance = userInfo["balance"] as! Money
        
        self.balance.text = "\(balance)원"
    }
}


