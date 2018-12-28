//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine: VendingMachine = VendingMachine()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        vendingMachine.add(product: Beverage.produce(addableBeverage: .cocaCola))
        vendingMachine.add(product: Beverage.produce(addableBeverage: .cocaCola))
        vendingMachine.add(product: Beverage.produce(addableBeverage: .cocaColaZero))
        vendingMachine.add(product: Beverage.produce(addableBeverage: .starbucksDoubleShot))
        let inventory = vendingMachine.inventory()
        for (product, count) in inventory {
            print("\(product)(\(count)개)")
        }
    }
}

