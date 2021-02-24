//
//  BeverageStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BeverageStorage {
    private var stock: [Item]
    
    init() {
        stock = []
    }
    
    public func addStock(with beverage: Beverage, amount: Int) {
        let newItem = Item(with: beverage, of: amount)
        let itemIndex = stock.firstIndex { (alreadyStoredItem) -> Bool in
            alreadyStoredItem.isSameItem(with: newItem)
        }
        if itemIndex != nil {
            stock[itemIndex!].increaseAmount(by: amount)
        } else {
            stock.append(newItem)
        }
    }

    public func showStock() -> [String:Int] {
        var result = [String:Int]()
        stock.forEach { (item) in
            result[item.showItemDetails().beverage] = item.showItemDetails().amount
        }
        return result
    }
    
    public func showPurchasableBeverages(with money: Int = 999_999_999) -> [String:Int] {
        var result = [String:Int]()
        stock.forEach { (item) in
            guard item.isSoldOut() == false else { return }
            result[item.showItemDetails().beverage] = item.showItemDetails().amount
        }
        return result
    }
    
    public func putSelectedBeverageOut(at index: Int) -> Beverage? {
        if stock[index].isSoldOut() || index >= stock.count {
            return nil
        } else {
            return stock[index].isPurchased()
        }
    }
}

