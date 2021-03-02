//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import UIKit

class VendingMachineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let beverages = [Beverage]()
        let vendingMachine = VendingMachine(beverages: beverages)
        vendingMachine.addBeverage(beverage: Milk(brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", manufacturedAt: Date.convertToDate("20171009"), kind: .strawberryMilk))
        vendingMachine.addBeverage(beverage: Milk(brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", manufacturedAt: Date.convertToDate("20171012"), kind: .strawberryMilk))
        vendingMachine.addBeverage(beverage: Soda(brand: "펩시", volume: 350, price: 2000, name: "다이어트콜라", manufacturedAt: Date.convertToDate("20171005"), kind: .coke))
        vendingMachine.addBeverage(beverage: Coffee(brand: "맥심", volume: 400, price: 3000, name: "TOP아메리카노", manufacturedAt: Date.convertToDate("20171010"), kind: .top))
        vendingMachine.retrieveBeverage(completion: { beverage in
            print(beverage)
        })
    }
}

