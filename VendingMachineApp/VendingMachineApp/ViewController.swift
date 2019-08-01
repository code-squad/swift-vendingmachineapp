//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by jang gukjin on 15/07/2019.
//  Copyright © 2019 jang gukjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let strawberryMilk = StrawberryMilk()
    let chocolateMilk = ChocolateMilk()
    let coke = Coke()
    let sprite = Sprite()
    let topCoffee = TOPCoffee()
    let cantataCoffee = CantataCoffee()
    
    private var vendingMachine = VendingMachine()
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine.stockUp(of: strawberryMilk, count: 2)
        vendingMachine.stockUp(of: chocolateMilk, count: 1)
        vendingMachine.stockUp(of: coke, count: 1)
        
        for (key, value) in vendingMachine.isFullStock() {
            print("\(key.getName()) (\(value)개)", terminator: " ")
        }
    }

}

