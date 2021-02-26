//
//  OutputViewPrintable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

protocol OutputViewPrintable {
    func printBeverage(handler: (Beverage) -> ())
}
