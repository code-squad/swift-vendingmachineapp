//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        vendingMachine.supply(6, amount: 1)
        
        print(vendingMachine.getStockList())
    }

    @IBAction func bananaMilkSupply(_ sender: Any) {
        vendingMachine.supply(1, amount: 1)
    }
    @IBAction func strawberryMilkSupply(_ sender: Any) {
        vendingMachine.supply(2, amount: 1)
    }
    @IBAction func fantaSupply(_ sender: Any) {
        vendingMachine.supply(3, amount: 1)
    }
    @IBAction func topSupply(_ sender: Any) {
        vendingMachine.supply(4, amount: 1)
    }
    @IBAction func hot6Supply(_ sender: Any) {
        vendingMachine.supply(5, amount: 1)
    }
    @IBAction func pepsiCokeSupply(_ sender: Any) {
        vendingMachine.supply(6, amount: 1)
    }
    
}

