//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Viet on 2020/03/10.
//  Copyright © 2020 Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let milk = Beverage(name: "날마다딸기우유", price: 1000, capacity: 200, brand: "서울우유", productionDate: ProductionDate(from: "20171009"))
        let cola = Beverage(name: "다이어트콜라", price: 2000, capacity: 350, brand: "펩시", productionDate: ProductionDate(from: "20171010"))
        let coffee = Beverage(name: "TOP아메리카노", price: 3000, capacity: 400, brand: "맥심", productionDate: ProductionDate(from: "20171010"))

        print(milk, cola, coffee, separator: "\n")
    }
}

