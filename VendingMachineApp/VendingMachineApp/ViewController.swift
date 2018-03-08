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
                        name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
                        strawberrySyrup: 5)
        let bananaMilk: Beverage = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유",
                                    manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
        let coke: Beverage = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라",
                        manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

