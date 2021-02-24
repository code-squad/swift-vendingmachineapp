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
    
    public func checkStock() {
        var index: Int = 0
        for item in stock {
            if item.amt == 0 {stock.remove(at: index); index -= 1}
            index += 1
        }
    }
    
    private func makeStockReport(withItemPriceAboveOf amount: Int = 999_999_999) -> String {
        var result = ""
        stock.enumerated().forEach { (index, item) in
            guard item.bev.isPurchasable(with: amount) else {return}
            result.append("\(item.bev), 남은수량: \(item.amt), \(index)번 자리")
        }
        return result
    }
    
    public func showPurchasableBeverage(with money: Int) -> String {
        makeStockReport(withItemPriceAboveOf: money)
    }
    
    public func putSelectedBeverageOut(at index: Int) -> Beverage? {
        guard index < stock.count else {return nil}
        let beverage = stock[index].bev
        stock[index].amt -= 1
        return beverage
    }
}

extension BeverageStorage: CustomStringConvertible {
    var description: String {
        makeStockReport()
    }
}
