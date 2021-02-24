//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drinks:[Drink] = [ Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다서울우유", date: Date().date("20171009")),
                       Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다서울우유", date: Date().date("20171012")),
                       Soda(brand: "펩시", capacity: 350, price: 2000, name: "다이어트콜라", date: Date().date("20171005")),
                       Coffee(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", date: Date().date("20171010"))
        ]
        
        let vendingMachine = VendingMachine(drinks: drinks)
        
        vendingMachine.show { drink in
            print(drink)
        }
    }
    
    
}

