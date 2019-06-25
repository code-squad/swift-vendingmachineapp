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
        vendingMachine.supply(1, amount: 1)
        vendingMachine.supply(2, amount: 2)
        vendingMachine.supply(6, amount: 1)
        
        print(vendingMachine.getStockList())
    }


}

