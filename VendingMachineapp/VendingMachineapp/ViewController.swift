//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        run()
    }
    
    func run() {
        let vendingMachine = VendingMachine(money: 1000)
        
        let milk1: Milk = StrawberryMilk(manufacturer: "서울우유", volume: 200, price: 1000, brand: "날마다딸기우유", manufactured: Date.stringToDate(date: "20171009"), expirydate: Date.stringToDate(date: "20210228"), calorie: 200, hot: false, type: .strawberry, lowFat: false)
        
        let milk2: Milk = StrawberryMilk(manufacturer: "서울우유", volume: 200, price: 1000, brand: "날마다딸기우유", manufactured: Date.stringToDate(date: "20171009"), expirydate: Date.stringToDate(date: "20210220"), calorie: 200, hot: false, type: .strawberry, lowFat: false)
        
        let soda: Soda = Coke(manufacturer: "팹시", volume: 350, price: 2000, brand: "다이어트콜라", manufactured: Date.stringToDate(date: "20171005"), expirydate: Date.stringToDate(date: "20221005"), calorie: 100, hot: false, type: .coke, flavor: "콜라맛")

        let coffee: Coffee = Top(manufacturer: "맥심", volume: 400, price: 3000, brand: "TOP아메리카노", manufactured: Date.stringToDate(date: "20171010"), expirydate: Date.stringToDate(date: "20211231"), calorie: 350, hot: false, type: .top, caffeineContent: 20)

        vendingMachine.addBeverage(beverage: milk1)
        vendingMachine.addBeverage(beverage: milk2)
        vendingMachine.addBeverage(beverage: soda)
        vendingMachine.addBeverage(beverage: coffee)
    }
}

