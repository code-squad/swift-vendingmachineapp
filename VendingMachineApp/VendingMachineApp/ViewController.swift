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

        let beverage = MilkFactory().create()
        let beverage2 = SodaFactory().create()
        let beverage3 = CoffeeFactory().create()
        
        vendingMachine.appendBeverage(beverage)
        vendingMachine.appendBeverage(beverage2)
        vendingMachine.appendBeverage(beverage3)
    }
}
