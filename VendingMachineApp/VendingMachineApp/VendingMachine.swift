//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine {
    func printBeverage(_ beverage : CustomStringConvertible ){
        print(beverage.description)
    }
    
    func printBeverages(_ beverages : [CustomStringConvertible] ){
        beverages.forEach{ print($0.description) }
    }
}
