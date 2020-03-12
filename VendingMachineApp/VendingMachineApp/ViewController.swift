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
        let chocoMilk = ChocolateMilk(brand: "Seoul", capacity: 300, price: 1200, name: "초코우유", manufacturingDate: "20200218", expiryDate: "20200228")
        let fanta = Fanta(taste: "Orange", brand: "CokeCola", capacity: 355, price: 500, name: "환타오렌지맛", manufacturingDate: "20200101", expiryDate: "20200131")
        let georgia = Georgia(brand: "Lotte", capacity: 240, price: 800, name: "조지아커피", manufacturingDate: "20200201", expiryDate: "20200228")
        
        vendingMachine.addDrinkStock(drink: chocoMilk)
        vendingMachine.addDrinkStock(drink: fanta)
        vendingMachine.addDrinkStock(drink: georgia)
        
        vendingMachine.showStockList()
    }


}

