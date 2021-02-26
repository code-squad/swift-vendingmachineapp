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
            StrawberryMilk.init(date: Date().date("20210226"), lowFat: false, container: .bottle)
        ])
        
        let vendingMachine = VendingMachine(drinks: drinks)
        
        vendingMachine.show { drink in
            print(drink)
        }
    }
    
    
}

