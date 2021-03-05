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

        let beverage = FactoryManager.create(type: MilkFactory.self)
        let beverage2 = FactoryManager.create(type: SodaFactory.self)
        let beverage3 = FactoryManager.create(type: CoffeeFactory.self)
        
        vendingMachine.appendInventory(beverage)
        vendingMachine.appendInventory(beverage2)
        vendingMachine.appendInventory(beverage3)
    }
}
