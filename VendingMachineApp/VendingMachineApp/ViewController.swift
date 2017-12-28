//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2017. 12. 28..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine()
    override func viewDidLoad() {
        super.viewDidLoad()
        setVendingMachine()
        printVendingMachine()
    }

    private func setVendingMachine() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000,
                                                 name: "날마다딸기우유",
                                                 dateOfManufacture: dateOfManufacture,
                                                 validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000,
                                       name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000,
                                   name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        vendingMachine.addInventory(category: String(strawberryMilk.description.split(separator: "(")[0]), product: strawberryMilk)
        vendingMachine.addInventory(category: String(pepciCoke.description.split(separator: "(")[0]), product: pepciCoke)
        vendingMachine.addInventory(category: String(georgia.description.split(separator: "(")[0]), product: georgia)
    }

    private func printVendingMachine() {
        for (key, value) in vendingMachine.getInventory() {
            print("\(key) \(value[0].price)원(\(value.count)개)", terminator: " ")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
