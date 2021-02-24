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

    public func showStock() -> String {
        var result = ""
        stock.enumerated().forEach { (index, item) in
            result.append("\(index)번 슬롯: \(item)\n")
        }
        return result
    }
    
    public func showPurchasableBeverages(with money: Int = 999_999_999) -> String {
        var result = "구매 가능한 음료 목록 ----\n"
        stock.enumerated().forEach { (index, item) in
            guard item.isAvailable(with: money) else { return }
            result.append("\(index)번 슬롯: \(item)\n")
        }
        return result
    }
    
    public func showExpiredBeverages() -> String {
        var result = "유통기한 지난 음료 목록 ----\n"
        stock.enumerated().forEach { (index, item) in
            guard item.isExpiredItem() else { return }
            result.append("\(index)번 슬롯: \(item)\n")
        }
        return result
    }
    
    public func putSelectedBeverageOut(at index: Int) -> Beverage? {
        guard index < stock.count else { return nil }
        guard index > -1 else { return nil }
        return stock[index].isPurchased()
    }
}

