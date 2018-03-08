//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 08/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    
    required init?(coder aDecoder: NSCoder) {
        vendingMachine = VendingMachine()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine.insertBeverage(beverageMenu: .bananaMilk, quantity: 2)
        vendingMachine.insertBeverage(beverageMenu: .cocaCola, quantity: 2)
        vendingMachine.insertBeverage(beverageMenu: .pepsi, quantity: 3)
        
        let result: String = vendingMachine.countCurrentInventory().reduce("=> ") {
            $0 + $1.beverageMenu.makeInstance().description + "(" + String($1.quantity) + "개) "
        }
        
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

