//
//  StockController.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StockController: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(history, forKey: "history")
        aCoder.encode(shelf, forKey: "shelf")
        aCoder.encode(stock, forKey: "stock")
    }

    required init?(coder aDecoder: NSCoder) {
        history = aDecoder.decodeObject(forKey: "history") as! History
        shelf = aDecoder.decodeObject(forKey: "shelf") as! Shelf
        stock = aDecoder.decodeObject(forKey: "stock") as! Stock
    }

    private var history = History()
    private(set) var shelf = Shelf()
    private var stock = Stock()

    init (items: [Beverage]) {
        let stockSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.stock = Stock(sets: stockSets)
        super.init()
        items.forEach {item in self.history.addSupplyLog(item)}
    }

    func buy(itemCode: Int, balance: Int) throws -> Beverage {
        let key = try shelf.matchCode(option: itemCode)
        let item = stock.buy(itemCode: key)
        self.history.addPurchaseLog(item)
        return item
    }

//     remove한 뒤에 리턴해버리니까 음료수가 한개만 남은상태에서
    // 구매하려고하면 range에러뜨는 상황 발생해서 두 메소드로 나눔
    func removeItem(_ itemCode: Int) throws {
        let key = try shelf.matchCode(option: itemCode)
        self.stock.removeItem(key)
    }

    func addItem(item: Beverage) {
        self.stock.addItem(item)
        self.history.addSupplyLog(item)
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

    func howMany(of beverage: Beverage) -> Int {
        return self.stock.howManyItem(ObjectIdentifier(type(of: beverage)))
    }

    func lastPurchasedItem() -> (item: Beverage, index: Int?){
        return self.history.lastPurchasedItem()
    }
}
