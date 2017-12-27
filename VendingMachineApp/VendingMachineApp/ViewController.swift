//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachineData()
    override func viewDidLoad() {
        super.viewDidLoad()
        let banana = LightBananaMilk(manufacturingDate: "20171227")
        let coke = Coke(manufacturingDate: "20171227")
        let coffee = StarBucksCoffee(manufacturingDate: "20171227")
        vendingMachine.addBeverage(banana)
        vendingMachine.addBeverage(coke)
        vendingMachine.addBeverage(coke)
        vendingMachine.addBeverage(coffee)
        print(vendingMachine.sortedStockList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
