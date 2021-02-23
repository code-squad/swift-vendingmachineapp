//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let milk = Milk(manufacturer: "서울우유", volume: 200, brand: "날마다딸기우유", dateOfManufacture: Date(), price: 1000)
        let milk2 = Milk(manufacturer: "서울우유", volume: 200, brand: "날마다딸기우유", dateOfManufacture: Date(), price: 1000)
        let soda = Soda(manufacturer: "펩시", volume: 350, brand: "다이어트콜라", dateOfManufacture: Date(), price: 2000)
        let coffee = Coffee(manufacturer: "맥심", volume: 400, brand: "아메리카노", dateOfManufacture: Date(), price: 3000)
        
        [milk, milk2, soda, coffee].forEach { drink in
            print(drink)
        }
    }
}

