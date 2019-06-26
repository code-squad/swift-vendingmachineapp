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
    
    
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func refreshDrinkCount () {
        let stock = vendingMachine.getStockList()
        
        for (drink, count) in stock {
            if drink is BananaMilk {
                bananaMilkCount.text = "\(count)개"
            }
            if drink is StrawberryMilk {
                strawberryMilkCount.text = "\(count)개"
            }
            if drink is Fanta {
                fantaCount.text = "\(count)개"
            }
            if drink is TOP {
                topCount.text = "\(count)개"
            }
            if drink is Hot6 {
                hot6Count.text = "\(count)개"
            }
            if drink is PepsiCoke {
                pepsiCokeCount.text = "\(count)개"
            }
        }
    }

   

    @IBAction func drinkSupply(_ sender: UIButton) {
        vendingMachine.supply(sender.tag, amount: 1)
        refreshDrinkCount()
    }
    
    @IBAction func insertOneThousand(_ sender: Any) {
        vendingMachine.insertCoin(1000)
        let balance = vendingMachine.getBalance()
        self.balance.text = "\(balance)원"
    }
    @IBAction func insertFiveThousand(_ sender: Any) {
        vendingMachine.insertCoin(5000)
        let balance = vendingMachine.getBalance()
        self.balance.text = "\(balance)원"
    }
    
}

