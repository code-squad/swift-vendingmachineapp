//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let vendingMachine = VendingMachine()
    private let vendingStackView = VendingStackView()
    
    private let strawberryMilk = StrawberryMilk()
    private let dietCola =  DietCola()
    private let topAmericano = TopAmericano()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBeverage()
        
    }
    
    private func startVendingMachine() {
        
    }
    
    private func addBeverage() {
        vendingMachine.addBevergeStock(beverage: strawberryMilk)
        vendingMachine.addBevergeStock(beverage: dietCola)
        vendingMachine.addBevergeStock(beverage: topAmericano)
        vendingMachine.addBevergeStock(beverage: topAmericano)
        vendingMachine.addBevergeStock(beverage: topAmericano)
    }
}

