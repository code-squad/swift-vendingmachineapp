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
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
        
        vendingMachine.notifyStockToObservers()
        vendingMachine.notifyBalanceToObservers()
    }
    
    private func refreshDrinkCount (_ stock: [Int:Int]) {
        for (index, count) in stock {
            counts[index]?.text = String(count)+"개"
        }
    }
    
    private func refreshBalance (_ balance: String) {
        self.balance.text = balance+"원"
    }

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
        let stock = userInfo["stock"] as! [Int:Int]
        
        refreshDrinkCount(stock)
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let balance = userInfo["balance"] as! String
        
        refreshBalance(balance)
    }
}


