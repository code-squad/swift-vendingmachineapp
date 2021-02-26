//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bananaMilk = BananaMilk(brand: "서울우유", miliLiter: 100, price: 1000, name: "바나나우유2",dateOfManufacture: Date(), farmCode: "A", hasDoraemonSticker: false)
        let bananaMilk2 = BananaMilk(brand: "서울우유", miliLiter: 100, price: 1000, name: "바나나우유2",dateOfManufacture: Date(), farmCode: "A", hasDoraemonSticker: false)
        let coke = Coke(brand: "코카콜라", miliLiter: 300, price: 2000, name: "콜라", dateOfManufacture: Date(), taste: .lemon, hasCalorie: true)
        let top = Top(brand: "맥심", miliLiter: 400, price: 1500, name: "탑", dateOfManufacture: Date(), isHot: false, hasSugar: false)
            
        vendingMachine.appendBeverage(kindOfBeverage: bananaMilk)
        vendingMachine.appendBeverage(kindOfBeverage: bananaMilk2)
        vendingMachine.appendBeverage(kindOfBeverage: top)
        vendingMachine.appendBeverage(kindOfBeverage: coke)
        
        
        print(vendingMachine)
    }


}

