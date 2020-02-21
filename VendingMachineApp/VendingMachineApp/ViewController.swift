//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = VendingMachine()
        let strawberryMilk = Milk(brand: "서울우유", amount: 200, price: 1000, name: "날마다딸기우유", flavor: .strawberry)
        let cola = Soda(brand: "팹시", amount: 350, price: 2000, name: "다이어트콜라", category: .cola)
        let top = Coffee(brand: "맥심", amount: 400, price: 3000, name: "TOP아메리카노", category: .top)
        vendingMachine.addBeverage(beverage: strawberryMilk)
        vendingMachine.addBeverage(beverage: cola)
        vendingMachine.addBeverage(beverage: top)
        vendingMachine.printStock()
        
    }


}

