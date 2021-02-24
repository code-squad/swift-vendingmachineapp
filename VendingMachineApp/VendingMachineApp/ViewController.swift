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
        machine.increaseCashInMoneyStorage(by: 1000)
        machine.showBalance()
        let soda = Soda(brandName: "코카콜라", sizeInMilliliter: 100, itemPrice: 1000, itemName: "코카콜라")
        let milk = Milk(brandName: "남양유업", sizeInMilliliter: 400, itemPrice: 1500, itemName: "초코에몽")
        let americano = Americano(brandName: "스타벅스", sizeInMilliliter: 500, itemPrice: 4500, itemName: "콜드브루아메리카노", caffeine: 234)
        machine.addStock(beverage: soda, count: 2)
        machine.addStock(beverage: soda, count: 5)
        machine.addStock(beverage: milk, count: 10)
        machine.addStock(beverage: americano, count: 5)
        
        machine.purchaseBeverage(insert: 2000, index: 1)
        machine.transactionStopButtonPressed()
    }
}

