//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [StrawberryMilk(manufacturer: "매일유업",
                        size: 300,
                        price: 1500,
                        name: "상하목장 유기농 딸기우유",
                        farmCode: .incheonRhinoFarm,
                        strawberryContentRate: 0),
         Fanta(manufacturer: "코카콜라",
               size: 185,
               price: 900,
               name: "환타",
               bubbleIntensity: .medium,
               flavor: .orange),
         Top(manufacturer: "동서식품",
             size: 260,
             price: 1200,
             name: "티.오.피",
             caffeineContent: 120,
             temperature: 5,
             containerType: .cup)].forEach { vendingMachine.fill(beverage: $0) }
        
        print(vendingMachine.stockList)
    }
}

