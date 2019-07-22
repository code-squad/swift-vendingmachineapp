//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
        printInitialDrinkMenuList(vendingMachine)
    }

    func printInitialDrinkMenuList(_ vendingmachine: VendingMachine){
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print( "\(value.drinkName)(\(value.drinkStockList.count)개)", terminator: " ")
            }
            print()
        }
        vendingmachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }

}

