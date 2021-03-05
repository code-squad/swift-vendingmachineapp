//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine = VendingMachine()
    let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine.addToInventory(beverage: Milk(manufacturer: "서울우유", volume: 200, price: 950, skuName: "딸기우유", manufactureDate: date.dateFormatter(date: "2021-02-21"), milkSKU: .strawberry))
        vendingMachine.addToInventory(beverage: Milk(manufacturer: "서울우유", volume: 200, price: 950, skuName: "딸기우유", manufactureDate: date.dateFormatter(date: "2021-02-22"), milkSKU: .strawberry))
        vendingMachine.addToInventory(beverage: Soda(manufacturer: "Keurig", volume: 355, price: 1000, skuName: "DrPepper", manufactureDate: date.dateFormatter(date: "2021-02-08"), sodaSKU: .drPepper))
        vendingMachine.addToInventory(beverage: Coffee(manufacturer: "롯데칠성", volume: 275, price: 2200, skuName: "칸타타", manufactureDate: date.dateFormatter(date: "2021-02-10"), coffeeSKU: .cantata))
        
        vendingMachine.printInventoryList()
        
    }

}
