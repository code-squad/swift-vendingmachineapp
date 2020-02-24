//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = VendingMachine()
        let strawberryMilk = StrawberryMilk.everyDayStrawberryMilk()
        let cola = Cola.pepsiDietCoke()
        let top = Top.americano()
        vendingMachine.addBeverage(beverage: strawberryMilk)
        vendingMachine.addBeverage(beverage: cola)
        vendingMachine.addBeverage(beverage: top)
        vendingMachine.printStock()
    }
}

