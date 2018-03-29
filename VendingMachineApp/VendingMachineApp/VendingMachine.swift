//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    static var sharedInstance = VendingMachine()

    private override convenience init() {
        self.init(stockItems: Controller().setVendingMachineStock(unit: 1))
    }

    class func sharedVendingMachine() -> VendingMachine {
        return sharedInstance
    }

    class func loadData(_ data: VendingMachine) {
        sharedInstance = data
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(stock, forKey: "stock")
        aCoder.encode(balance, forKey: "balance")
    }

    required init?(coder aDecoder: NSCoder) {
        stock = aDecoder.decodeObject(forKey: "stock") as! StockController
        balance = aDecoder.decodeObject(forKey: "balance") as! Money
    }

    private(set) var stock = StockController(items: [Beverage]())
    private var balance = Money()

    private init(stockItems: [Beverage]) {
        super.init()
        self.stock = StockController(items: stockItems)
    }

    func addBalance(money: Int) {
        self.balance.add(money)
        NotificationCenter.default.post(name: .addBalance, object: nil)
    }

    func subtractBalance(money: Int) {
        self.balance.subtract(money)
    }

    func showBalance() -> Int {
        return self.balance.currentBalance()
    }

    func buy(itemCode: Int) throws -> Beverage {
        let selectedItem = try stock.buy(itemCode: itemCode, balance: showBalance())
        guard self.balance.isAffordable(item: selectedItem) else {
            throw Exception.notEnoughBalance
        }
        self.balance.subtract(selectedItem.price())
        try stock.removeItem(itemCode)
        return selectedItem
    }

    func add(inputItem: Beverage) {
        stock.addItem(item: inputItem)
        NotificationCenter.default.post(name: .addItem, object: nil)
    }

    func removeItem(itemCode: Int) throws {
        try stock.removeItem(itemCode)
    }

    func history() -> String {
        return stock.showHistory()
    }

    // 메뉴선택을 위해 itemCode와 가격까지 보여주는 메소드
    func showStock() -> String {
        return stock.menu()
    }

    // 맨 처음 모드 선택시에 보여주는 전체재고상태
    func showStockDefault() -> String {
        return stock.stockSummary()
    }

    // 뜨거운 음료
    func hotBeverage() -> [ObjectIdentifier: [Beverage]] {
        return stock.findHotBeverage()
    }

    // 유통기한 지난 음료
    func discardItems() -> [ObjectIdentifier: [Beverage]] {
        return stock.findDiscardBeverage()
    }

    // 유통기한 내의 음료
    func validItems() -> [ObjectIdentifier: [Beverage]] {
        return stock.findValidBeverage()
    }

    // 현재 금액으로 구매 가능한 음료수
    func possibleToBuy() -> [ObjectIdentifier: [Beverage]] {
        return stock.finditemsCheaper(than: self.balance)
    }

    // 컨트롤러가 계속 구매가능여부를 판단해서 메뉴를 다르게 출력할 수 있도록 가능여부를 리턴. 제일 저렴한 음료의 가격이 자판기를 진행할 수 있는 최소단위
    func hasMiminumBalance() -> Bool {
        return self.balance.hasMiminumBalance(than: stock.cheapestPrice())
    }

    func howMany(of beverage: Beverage) -> Int {
        return self.stock.howMany(of: beverage)
    }

}
