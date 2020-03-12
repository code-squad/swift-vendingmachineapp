//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/11.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
        let chocolateMilk = Milk(flavor: "초코", brand: "Lotte", capacity: 300, price: 1200, name: "진한초코우유", manufacturingDate: "20200128", expiryDate: "20200212")
        let fanta = Soda(carbonateContent: 20, brand: "Lotte", capacity: 355, price: 800, name: "환타", manufacturingDate: "20200301", expiryDate: "20200315")
        let georgia = Coffee(caffeineContent: 138, brand: "CokeCola", capacity: 240, price: 950, name: "조지아맥스", manufacturingDate: "20200315", expiryDate: "20200401")
        
        vendingMachine.addDrinkStock(drink: chocolateMilk)
        vendingMachine.addDrinkStock(drink: fanta)
        vendingMachine.addDrinkStock(drink: georgia)
        
        vendingMachine.showStockList()
    }


}

