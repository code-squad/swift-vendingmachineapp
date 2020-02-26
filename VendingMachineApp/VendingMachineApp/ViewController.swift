//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let seoulMilk = Beverage(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: Date(), expirationDate: Date(timeIntervalSinceNow: 86400), calorie: 100, temperature: 10)
        let pepsi = Beverage(brand: "펩시", capacity: 350, price: 2000, name: "다이어트콜라", manufacturingDate: Date(), expirationDate: Date(timeIntervalSinceNow: 86400), calorie: 120, temperature: 10)
        let maxim = Beverage(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: Date(timeIntervalSinceNow: -86400 * 2), expirationDate: Date(timeIntervalSinceNow: 86400), calorie: 140, temperature: 10)
        let vendingMachine = VendingMachine()
        
        vendingMachine.insert(beverage: seoulMilk)
        vendingMachine.insert(beverage: pepsi)
        vendingMachine.insert(beverage: maxim)
        
        vendingMachine.forEachBeverages{
            print($0)
        }
    }
}

