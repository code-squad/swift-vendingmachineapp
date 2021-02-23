//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let machine = Machine()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        machine.showBalance()
        machine.increaseMoney(by: 1000)
        machine.showBalance()
        
        let soda = Soda(brandName: "코카콜라", sizeInMilliliter: 100, itemPrice: 1000, itemName: "코카콜라")
        let milk = Milk(brandName: "남양유업", sizeInMilliliter: 123, itemPrice: 1234, itemName: "초코에몽")
        machine.addStock(beverage: soda, count: 2)
        machine.checkStock()
        machine.addStock(beverage: soda, count: 5)
        machine.addStock(beverage: milk, count: 10)
        machine.checkStock()
        machine.receiveMoney(amount: 1000)
        machine.showPurchasables()
    }
}

