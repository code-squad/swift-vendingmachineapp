//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 8..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000,
                        name: "딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
                        strawberrySyrup: 5)
        let bananaMilk: Beverage = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "바나나우유",
                                    manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
        let coke: Beverage = Coke(brand: "팹시", weight: 350, price: 2000, name: "팹시콜라",
                        manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
        
        vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
        vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
        vendingMachine.addInInventory(beverageName: coke, number: 3)
        
        for menu in vendingMachine.showEntireInventory() {
            let beverage = menu.value
            guard let beverageName = beverage.first?.name else {
                return
            }
            print("\(beverageName)(\(beverage.count)개)", terminator: " ")
        }
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
