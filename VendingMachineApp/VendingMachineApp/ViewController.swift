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
        ])
        
        let vendingMachine = VendingMachine(drinks: drinks)
        
        vendingMachine.show { drink in
            print(drink)
        }
    }
    
    
}

