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
        
        let drinks = Drinks([
            StrawberryMilk(date: Date().date("20210220"), lowFat: false, container: .bottle, expiration: Date().date("20210310"), hot: false, calorie: 175)
        ])
        
        let vendingMachine = VendingMachine(drinks: drinks)
        
        vendingMachine.show { drink in
            print(drink)
        }
    }
    
    
}

