//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

protocol OutputViewPrintable {
    func printBeverage(handler: (Beverage) -> ())
}

struct OutputView {
    static func printInventory(of vendingMachine: OutputViewPrintable) {
        vendingMachine.printBeverage {
            print($0)
        }
    }
}
