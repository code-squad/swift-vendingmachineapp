//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 28..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vendingMachine: CoreVendingMachine!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        vendingMachine = CoreVendingMachine()

        do {
            try vendingMachine.add(productIndex: 1)
            try vendingMachine.add(productIndex: 2)
            try vendingMachine.add(productIndex: 3)
        } catch let error {
            print(error)
        }

        let dictionaryCountOfDrinks = vendingMachine.listOfInventory()
        var listOfInventory = ""
        for drink in dictionaryCountOfDrinks {
            listOfInventory += String(format: "%@(%d개) ",
                                      drink.key.typeOfProduct,
                                      drink.value)
        }
        print(listOfInventory)

    }

}

