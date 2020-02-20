//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [
        Milk(name: "바나나는 원래 하얗다", brand: "매일우유", servingSize: 150, price: 1200, dateOfManufacture: Date(), milkType: .bananaMilk),
        Soda(name: "펩시", brand: "PEPSI", servingSize: 120, price: 900, dateOfManufacture: Date(), sodaType: .coke),
        Coffee(name: "TOP아메리카노", brand: "TOP", servingSize: 180, price: 1500, dateOfManufacture: Date(), coffeeType: .TOP)
        ].forEach{ print($0) }
    }


}

