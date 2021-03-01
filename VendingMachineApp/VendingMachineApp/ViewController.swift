//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let beverage = MilkFactory()
        let beverage2 = SodaFactory()
        let beverage3 = CoffeeFactory()

        vendingMachine.appendBeverage(kindOfBeverage: beverage.create())
        vendingMachine.appendBeverage(kindOfBeverage: beverage2.create())
        vendingMachine.appendBeverage(kindOfBeverage: beverage3.create())
 
        print(vendingMachine)
    }
}
