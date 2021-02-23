//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beverage : [Beverage] = [StrawberryMilk.init(liter: 200, price: 1000, name: "딸기우유", date: "20210209"),
                                     StrawberryMilk.init(liter: 200, price: 100, name: "딸기우유", date: "20210212"),
                                     DietCola.init(liter: 350, price: 2000, name: "다이어트콜라", date: "20210201"),
                                     TopAmericano.init(liter: 400, price: 3000, name: "TOP아메리카노", date: "20210222")
        ]
        
        let vendingMachine = VendingMachine(beverage: beverage)
        vendingMachine.showBeverageList { (beverage) in
            print(beverage.description)
        }
    }
    
}

