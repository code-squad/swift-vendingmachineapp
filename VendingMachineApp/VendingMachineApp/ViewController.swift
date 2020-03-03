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
         Sprite(manufacturer: "코카콜라",
                size: 250,
                price: 1200,
                name: "스프라이트",
                bubbleIntensity: .medium,
                container: .can)].forEach { vendingMachine.fill(beverage: $0) }
        
        print(vendingMachine.stockList)
    }
}

