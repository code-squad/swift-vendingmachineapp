//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이진영 on 2019/11/26.
//  Copyright © 2019 이진영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beverages = BeverageGenerator.generateBeverage()
        let beverageInventory = BeverageInventory(stock: beverages)
        let vendingMachine = VendingMachine(inventory: beverageInventory)
        
        vendingMachine.showInventory {
            print("\($1) (\($3)개)")
        }
    }


}

