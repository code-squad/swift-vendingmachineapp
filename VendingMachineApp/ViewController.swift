//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingmachine = VendingMachine()
        vendingmachine.append(drink: StroberryMilk(brand: "서울우유", capacity: 200, price: 2500, name: "딸기우유", create:"20200403", expire: "20200412", content: 1.0))
        vendingmachine.append(drink: Georgia(brand: "스타벅스", capacity: 350, price: 5000, name: "조지아", create: "20200202", caffeine: 150, hot: false))
        vendingmachine.showElements()
    }
}

