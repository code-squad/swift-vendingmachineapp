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
        let vendingMachine = VendingMachine()
        
        let milk1: Milk = StrawberryMilk(manufacturer: "서울우유", volume: 200, price: 1000, brand: "날마다딸기우유", manufactoringDate: Date.stringToDate(date: "20171009"), type: .strawberry)
        let milk2: Milk = StrawberryMilk(manufacturer: "서울우유", volume: 200, price: 1000, brand: "날마다딸기우유", manufactoringDate: Date.stringToDate(date: "20171012"), type: .strawberry)
        let soda: Soda = Coke(manufacturer: "팹시", volume: 350, price: 2000, brand: "다이어트콜라", manufactoringDate: Date.stringToDate(date: "20171005"), type: .coke)
        let coffee: Coffee = Top(manufacturer: "맥심", volume: 400, price: 3000, brand: "TOP아메리카노", manufactoringDate: Date.stringToDate(date: "20171010"), type: .top)
        
        vendingMachine.addBeverage(beverage: milk1)
        vendingMachine.addBeverage(beverage: milk2)
        vendingMachine.addBeverage(beverage: soda)
        vendingMachine.addBeverage(beverage: coffee)
        
        vendingMachine.printList()
    }
}

