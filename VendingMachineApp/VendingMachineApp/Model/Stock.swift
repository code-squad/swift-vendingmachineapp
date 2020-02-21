//
//  Stock.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Stock {
    var soda = [Soda]()
    var coffee = [Coffee]()
    var milk = [Milk]()
    
    func add(beverage: Beverage) {
        switch beverage {
        case is Soda:
            soda.append(beverage as! Soda)
        case is Coffee:
            coffee.append(beverage as! Coffee)
        case is Milk:
            milk.append(beverage as! Milk)
        default:
            break
        }
    }
    
    private func printOut(stock: [Beverage]) {
        stock.forEach {
            print($0)
        }
    }
    
    func printAll() {
        printOut(stock: soda)
        printOut(stock: coffee)
        printOut(stock: milk)
    }
}
