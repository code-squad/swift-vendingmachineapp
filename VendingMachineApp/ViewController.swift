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
        vendingmachine.append(drink: Milk(brand: "서울우유", capacity: 200, price: 2500, name: "딸기우유", create:"20200403", kind: .Stroberry))
        vendingmachine.append(drink: Coffee(brand: "맥심", capacity: 100, price: 1000, name: "TOP아메리카노", create: "20210202", kind: .Top))
        vendingmachine.append(drink: Soda(brand: "팹시", capacity: 350, price: 4000, name: "다이어트콜라", create: "20180903", kind: .Coke))
        vendingmachine.showElements()
    }
}

