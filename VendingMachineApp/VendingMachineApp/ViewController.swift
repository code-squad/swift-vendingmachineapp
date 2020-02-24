//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine(products: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chocoMilk1 = ChocolateMilk(name: "서울우유 초코맛", brand: "서울우유", servingSize: 120, price: Money(1500), dateOfManufacture: Date(), farmCode: "AEKS1238", cacaoContentRate: 80)
        let chocoMilk2 = ChocolateMilk(name: "서울우유 초코맛", brand: "서울우유", servingSize: 120, price: Money(1500), dateOfManufacture: Date(), farmCode: "AEKS1238", cacaoContentRate: 90)
        print(ObjectIdentifier(chocoMilk1))
        print(ObjectIdentifier(chocoMilk1))
        print(ObjectIdentifier(chocoMilk2.self))
        print(ObjectIdentifier(ChocolateMilk.self))
        print(type(of: ObjectIdentifier(type(of: chocoMilk2))))
    }
}

