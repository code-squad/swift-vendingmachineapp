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
        let strStrawberryMilk = StrawberryMilk.init(brand : "서울우유",
                                                    liter: 200,
                                                    price: 1000,
                                                    name: "딸기우유",
                                                    manufactured: Date.inputDate(date: "20210207"),
                                                    mlikFarmCode: 023,
                                                    expiryDate: Date.inputDate(date: "20210210"))
        let dietCola =  DietCola.init(brand : "팹시",
                                      liter: 350,
                                      price: 2000,
                                      name: "다이어트콜라",
                                      manufactured: Date.inputDate(date: "20210222"),calory: 123)
        let topAmericano =  TopAmericano.init(brand : "맥심",
                                              liter: 400,
                                              price: 3000,
                                              name: "TOP아메리카노",
                                              manufactured: Date.inputDate(date: "20210217"),
                                              caffeineContent: 130,
                                              hotNCold: "hot")
        
        
        let vendingMachine = VendingMachine()
        vendingMachine.putPayMoney(money: 5000)
        vendingMachine.addBevergeStock(beverage: strStrawberryMilk)
        vendingMachine.addBevergeStock(beverage: dietCola)
        vendingMachine.addBevergeStock(beverage: topAmericano)
        vendingMachine.addBevergeStock(beverage: topAmericano)
        vendingMachine.addBevergeStock(beverage: topAmericano)
        
        vendingMachine.showBeverageList {
            print($0)
        }
    }
    
}

