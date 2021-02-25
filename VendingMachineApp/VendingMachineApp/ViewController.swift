//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    private let vendingMachine = VendingMachine()
    private let staff = Staff()
    override func viewDidLoad() {
        super.viewDidLoad()

        staff.fill(vendingMachine: vendingMachine, beverage: Milk(brand: "빙그레", capacity: 240, price: 1400, name: "바나나맛우유", dateString: "20210225"))
        staff.fill(vendingMachine: vendingMachine, beverage: Milk(brand: "빙그레", capacity: 240, price: 1400, name: "바나나맛우유", dateString: "20210226"))
        staff.fill(vendingMachine: vendingMachine, beverage: Milk(brand: "코카콜라", capacity: 250, price: 1500, name: "코카콜라제로", dateString: "20210225"))
        staff.fill(vendingMachine: vendingMachine, beverage: Milk(brand: "맥심", capacity: 275, price: 2200, name: "TOP아메리카노", dateString: "20210225"))

        
        staff.checkStock(vendingMachine: vendingMachine)
    }
}

