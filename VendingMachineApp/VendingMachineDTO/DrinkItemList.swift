//
//  DrinkStockTable.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class DrinkItemList : CustomStringConvertible{
    private (set) var drinkStockInfo: BeverageInfo
    private var notForSaleList: [Drink] = [Drink]()
    private (set) var drinkStockList: [Drink]
    
    var isEmpty : Bool {
        return self.drinkStockList.isEmpty
    }
    
    init(drinkList: [Drink], stockInfo : BeverageInfo) {
        self.drinkStockList = drinkList
        self.drinkStockInfo = stockInfo
    }
    
    var initialDescription: String {
        return "\(self.drinkStockInfo.name) \(self.drinkStockList.count)"
    }
    
    var description: String {
        return "\(self.drinkStockInfo.name) \(self.drinkStockInfo.price)\(Currency.won) (\(self.drinkStockList.count))"
    }
    
    var drinkName: String {
        return drinkStockInfo.name
    }
    
    func removeFirstElement() -> Drink{
        makeNotForSaleList()
        let element = self.drinkStockList.removeFirst()
        return element
    }
    
    func removeElement(quantity: Int) -> (Drink, actualRemoved: Int){
        var removedItem: Drink!
        var actualRemoved = 0
        if self.drinkStockList.isEmpty {
            removedItem = removeZeroStock()
        }else if quantity >= self.drinkStockList.count {
            actualRemoved = self.drinkStockList.count
            removedItem = removeAllElement()
            return (removedItem, actualRemoved)
        }else{
            actualRemoved = quantity
            removedItem = removeElementDefault(quantity)
        }
        return (removedItem, actualRemoved)
    }
    
    private func removeZeroStock() -> Drink {
        return drinkStockInfo.drinkItemInfo
    }
    
    private func removeAllElement() -> Drink {
        let removeItem = self.drinkStockList.removeFirst()
        self.drinkStockList.removeAll()
        return removeItem
    }
    
    private func removeElementDefault(_ quantity: Int ) -> Drink {
        var removeItem: Drink!
        for _ in 0..<quantity{
            removeItem = self.drinkStockList.removeFirst()
        }
        return removeItem
    }
    
    func isAvailable(_ money: Int) -> Bool {
        if self.drinkStockInfo.isPurchasable(money) {
            return true
        }
        return false
    }
    
    func getHotDrinkList() -> [Drink]{
        return self.drinkStockList.filter { (drink) -> Bool in
            return drink.isHot()
        }
    }
    
    func makeNotForSaleList() -> [Drink]{
        self.drinkStockList.sort{ (first: Drink, second: Drink ) in
            first.date < second.date
        }
        self.drinkStockList = self.drinkStockList.filter { (element) -> Bool in
            if element.validate(with: Date.init()){
                return true
            }else {
                self.notForSaleList.append(element)
                return false
            }
        }
        return self.notForSaleList
    }
    
    func addItem(_ drink: Drink, quantity: Int) throws {
        if !self.drinkStockInfo.isSameDrinkGroup(drink) {
            throw VendingMachineError.addDrinkToUnknownMenuNumberError
        }
        for _ in 0..<quantity {
            drinkStockList.append(drink)
        }
    }
}
