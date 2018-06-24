//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 22..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine: VendingMachine!

    override func viewDidLoad() {
        super.viewDidLoad()
        beverageSetup()
        printAllStock()
        
    }
    
    func beverageSetup() {
        vendingMachine.addBeverage(StrawberryMilk.self, 2)
        vendingMachine.addBeverage(BananaMilk.self)
        vendingMachine.addBeverage(Coke.self, 3)
    }
    
    func printAllStock() {
        for stock in vendingMachine.readAllStock() {
            print("\(stock.beverageName)(\(stock.count)개)", terminator: " ")
        }
    }
}
