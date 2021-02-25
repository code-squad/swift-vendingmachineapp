//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = VendingMachine()
        vendingMachine.add(beverage: Cola(brand: "펩시", capacity: 500, price: 3000, name: "다이어트콜라", date: Date.input("20151010")))
        vendingMachine.add(beverage: StrawBerryMilk(brand: "서울우유", capacity: 300, price: 1000, name: "날마다딸기우유", date: Date.input("20151111")))
        vendingMachine.add(beverage: Top(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", date: Date.input("20151212")))
        vendingMachine.retreiveDrinks { (beverage) in
            print(beverage)
        }
    }


}

