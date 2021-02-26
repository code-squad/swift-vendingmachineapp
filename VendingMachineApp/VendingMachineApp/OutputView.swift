//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class OutputView {
    static func printBeverages(vendingMachine: OutputViewPrintable) {
        vendingMachine.printBeverage { beverage in
            print(beverage.description)
        }
    }
}
