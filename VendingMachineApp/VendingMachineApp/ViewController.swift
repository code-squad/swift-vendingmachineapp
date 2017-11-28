//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 28..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vendingMachine: VendingMachine!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        vendingMachine = VendingMachine()
        // 재고를 추가하기 위해 1번 모드 할당
        do {
            try vendingMachine.assignMode(mode: 1)
        } catch let error {
            print(error)
        }
        // 3개의 음료수 객체 추가
        addDrinkObject(number: 3)
        // 재고 출력
        if let menuContents = vendingMachine.makeMenu() {
            printInventory(menuContents: menuContents)
        }
    }

    func addDrinkObject(number: Count) {
        for productIndex in 1...number {
            vendingMachine.action(action: Action(option: 1, detail: productIndex)!)
        }
    }

    func printInventory(menuContents: MenuContents) {
        var listOfInventory = ""
        for drink in menuContents.inventory {
            listOfInventory += String(format: "%@(%d개) ",
                                      drink.key.typeOfProduct,
                                      drink.value)
        }
        print(listOfInventory)
    }

}

