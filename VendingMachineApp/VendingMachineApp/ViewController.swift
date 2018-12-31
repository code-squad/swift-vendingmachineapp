//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine: VendingMachine = VendingMachine()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        let beverage: Beverage
        
        switch sender.restorationIdentifier {
        case "mandarineMilk":
            beverage = Beverage.produce(product: MandarineMilk.self)
        case "lactoseFreeMilk":
            beverage = Beverage.produce(product: LactoseFreeMilk.self)
        case "starbucksDoubleShot":
            beverage = Beverage.produce(product: StarbucksDoubleShot.self)
        case "topTheBlack":
            beverage = Beverage.produce(product: TOPTheBlack.self)
        case "cocaCola":
            beverage = Beverage.produce(product: CocaCola.self)
        case "cocaColaZero":
            beverage = Beverage.produce(product: CocaColaZero.self)
        default:
            return
        }
        
        vendingMachine.add(product: beverage)
    }
}

