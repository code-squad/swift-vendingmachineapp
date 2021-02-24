//
//  BeverageStorage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BeverageStorage {
    //FIXME:- Item 데이터 타입 만들기
    typealias Item = (bev: Beverage, amt: Int)
    private var stock: [Item]
    
    init() {
        stock = []
    }
    
    public func addStock(with beverage: Beverage, amount: Int) {
        let stockIndex = stock.firstIndex { (item) -> Bool in
            item.bev.isSameBeverage(with: beverage)
        }
        
        if stockIndex != nil {
            let remainingAmount = stock[stockIndex!].amt
            stock.remove(at: stockIndex!)
            stock.insert((bev: beverage, amt: amount + remainingAmount), at: stockIndex!)
        } else {
            stock.append((bev: beverage, amt: amount))
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
