//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var beverages: [Beverage] = []
    private let cola = Cola(brand: "코카콜라", weight: 1332, price: 1500, name: "코카콜라 제로", dateOfManufacture: Date(), pondusHydrogenii: 2.5)
    private let top = Top(brand: "맥심", weight: 500, price: 2058, name: "스위트 아메리카", dateOfManufacture: Date(), coffeeVarieties: "아라비카")
    private let bananaMilk = BananaMilk(brand: "빙그레", weight: 250, price: 1300, name: "바나나맛 우유", dateOfManufacture: Date(), flavor: "바나나")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverages.append(cola)
        beverages.append(top)
        beverages.append(bananaMilk)
        beverages.forEach { print($0) }
    }
}

