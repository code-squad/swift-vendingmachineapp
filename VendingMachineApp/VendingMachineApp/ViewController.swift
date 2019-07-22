//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by hw on 22/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine!
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
        printInitialDrinkMenuList()
    }

    func printInitialDrinkMenuList(){
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print( "\(value.drinkName)(\(value.drinkStockList.count)개)", terminator: " ")
            }
            print()
        }
        vendingMachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }

}

