//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 25/09/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = VendingMachine(storage: Storage())
        
        vendingMachine.addStock(of: StrawberryMilk(), count: 2)
        vendingMachine.addStock(of: ChocolateMilk(), count: 5)
        vendingMachine.addStock(of: Coke(), count: 1)
        
        vendingMachine.showInventory { beverage in
            beverage.forEach { item in
                print("\(item.name) (\(item.count)개)")
            }
        }
    }
}
