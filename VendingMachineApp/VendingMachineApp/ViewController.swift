//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 8..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let machine: VendingMachine

    required init?(coder aDecoder: NSCoder) {
        machine = VendingMachine()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let machine = VendingMachine()
        machine.supply(productType: .strawberryMilk, 2)
        machine.supply(productType: .bananaMilk, 1)
        machine.supply(productType: .coke, 3)
        for beverage in machine.checkTheStock() {
            print("\(beverage.key.productName)(\(beverage.value)개)", terminator: "  ")
        }
    }
}
