//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine.fill(beverage: Milk(product: .strawberryMilk))
        vendingMachine.fill(beverage: SoftDrink(product: .fanta))
        vendingMachine.fill(beverage: Coffee(product: .top))
        print(vendingMachine.stockList)
    }
}

