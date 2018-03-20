//
//  StockController.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StockController {

    private var history = History()
    private(set) var shelf = Shelf()
    private var stock = Stock()

    init (items: [Beverage]) {
        items.forEach {item in self.history.addSupplyLog(item)}
        let stockSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.shelf = Shelf(items: stockSets)
        self.stock = Stock(sets: stockSets)
    }

    func buy(itemCode: Int, balance: Int) throws -> Beverage {
        let key = try shelf.matchCode(option: itemCode)
        let item = stock.buy(itemCode: key)
        self.history.addPurchaseLog(item)
        self.shelf = shelf.update(newItems: self.stock.currentInventory())
        return item
    }

    // remove한 뒤에 리턴해버리니까 음료수가 한개만 남은상태에서
    // 구매하려고하면 range에러뜨는 상황 발생해서 두 메소드로 나눔
    func removeItem(_ itemCode: Int) throws {
        let key = try shelf.matchCode(option: itemCode)
        self.stock.removeItem(key)
        self.shelf = shelf.update(newItems: self.stock.currentInventory())
    }

    func addItem(item: Beverage) {
        self.stock.addItem(item)
        self.history.addSupplyLog(item)
        self.shelf = shelf.update(newItems: self.stock.currentInventory())
    }

    func findHotBeverage() -> [ObjectIdentifier: [Beverage]] {
        return stock.findHotBeverage()
    }

    func menu() -> String {
        return stock.menu(itemCodes: self.shelf)
    }

    func stockSummary() -> String {
        return stock.summary()
    }

    // 유통기한 지난 음료
    func findDiscardBeverage() -> [ObjectIdentifier: [Beverage]] {
        return stock.findDiscardBeverage()
    }

    // 유통기한 내의 음료
    func findValidBeverage() -> [ObjectIdentifier: [Beverage]] {
        return stock.findValidBeverage()
    }

    func finditemsCheaper(than balance: Money) -> [ObjectIdentifier: [Beverage]] {
        return stock.finditemsCheaper(than: balance)
    }

    func showHistory() -> String {
        return self.history.log()
    }

    // 가장 저렴한 금액의 음료 가격 리턴
    func cheapestPrice() -> Int {
        return stock.cheapestPrice()
    }

}
