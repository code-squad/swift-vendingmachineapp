//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let beverage : [Beverage] = [StrawberryMilk.init(brand : "서울우유",
                                                         liter: 200,
                                                         price: 1000,
                                                         name: "딸기우유",
                                                         manufactured: Date.inputDate(date: "20210207"),
                                                         mlikFarmCode: 023,
                                                         expiryDate: Date.inputDate(date: "20210210")),
                                     StrawberryMilk.init(brand : "서울우유",
                                                         liter: 200,
                                                         price: 100,
                                                         name: "딸기우유",
                                                         manufactured: Date.inputDate(date: "20210211"),
                                                         mlikFarmCode: 024,
                                                         expiryDate: Date.inputDate(date: "20210218")),
                                     DietCola.init(brand : "팹시",
                                                   liter: 350,
                                                   price: 2000,
                                                   name: "다이어트콜라",
                                                   manufactured: Date.inputDate(date: "20210222"),calory: 123),
                                     TopAmericano.init(brand : "맥심",
                                                       liter: 400,
                                                       price: 3000,
                                                       name: "TOP아메리카노",
                                                       manufactured: Date.inputDate(date: "20210217"),
                                                       caffeineContent: 130,
                                                       hotNCold: "hot")
        ]
        
        let vendingMachine = VendingMachine()
    }
    
}

