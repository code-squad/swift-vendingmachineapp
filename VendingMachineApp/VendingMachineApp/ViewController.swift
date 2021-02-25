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
        let bananaMilk = BananaMilk(brand: "서울우유", miliLiter: 100, price: 1000, name: "바나나우유2", dateOfManufacture: Date())
        let bananaMilk2 = BananaMilk(brand: "빙그레", miliLiter: 200, price: 1000, name: "바나나우유", dateOfManufacture: Date())
        let coke = Coke(brand: "코카콜라", miliLiter: 300, price: 2000, name: "콜라", dateOfManufacture: Date())
        let top = Top(brand: "맥심", miliLiter: 400, price: 1500, name: "탑", dateOfManufacture: Date())
        
        vendingMachine.appendMilk(kindOfMilk: bananaMilk)
        vendingMachine.appendMilk(kindOfMilk: bananaMilk2)
        vendingMachine.appendCoffe(kindOfCoffe: top)
        vendingMachine.appendSoda(kindOfSoda: coke)
        
        print(vendingMachine)
    }


}

