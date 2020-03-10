//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var beverages: [ElementsOfBeverage] = []
    let cola = Cola(brand: "코카콜라", weight: 123, price: 1234, name: "코쿼콜라")
    let top = Top(brand: "Top", weight: 12, price: 123, name: "티오피")
    let bananaMilk = BananaMilk(brand: "bananaMilk", weight: 1, price: 12, name: "바나나우유")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverages.append(cola)
        beverages.append(top)
        beverages.append(bananaMilk)
        beverages.forEach { print($0) }
    }
}

