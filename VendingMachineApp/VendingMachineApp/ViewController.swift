//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let machine = VendingMachine()
        
        machine.addBeverage(Milk(kind: .banana))
        machine.addBeverage(Soda(kind: .sprite))
        machine.addBeverage(Coffee(kind: .cantata))
        
        machine.beverageInfo(printBeverage(beverage:))
    }
    
    private func printBeverage(beverage: Beverage) {
        print(beverage)
    }
}

