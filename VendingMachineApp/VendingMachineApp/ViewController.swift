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
        addDrinkObject(number: 3)
        let dictionaryCountOfDrinks = vendingMachine.listOfInventory()
        printInventory(dictionaryCountOfDrinks)
    }

    func addDrinkObject(number: Count) {
        for productIndex in 1...number {
            do {
                try vendingMachine.add(productIndex: productIndex)
            } catch let error {
                print(error)
            }
        }
    }

    func printInventory(_ dictionaryCountOfDrinks: [Drink: Count]) {
        var listOfInventory = ""
        for drink in dictionaryCountOfDrinks {
            listOfInventory += String(format: "%@(%d개) ",
                                      drink.key.typeOfProduct,
                                      drink.value)
        }
        print(listOfInventory)
    }

}

