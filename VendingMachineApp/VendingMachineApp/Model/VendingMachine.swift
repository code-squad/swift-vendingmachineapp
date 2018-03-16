//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    static var shardManager = VendingMachine()
    private(set) var coins: Int = 0
    private var inventoryBox = InventoryBox()
    private var purchaseProductHistory = PurchaseProductHistory()
    
    private override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        coins = aDecoder.decodeInteger(forKey: "coins")
        inventoryBox = (aDecoder.decodeObject(forKey: "inventoryBox") as? InventoryBox)!
        purchaseProductHistory = (aDecoder.decodeObject(forKey: "purchaseProductHistory") as? PurchaseProductHistory)!
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(coins, forKey: "coins")
        aCoder.encode(inventoryBox, forKey: "inventoryBox")
        aCoder.encode(purchaseProductHistory, forKey: "purchaseProductHistory")
    }
    
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    func putCoins(coins: Int) {
        self.coins = coins
    }
    
    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addInInventory(beverageName: Beverage, number: Int) {
        for _ in 0..<number {
            inventoryBox.storageBeverageStock(beverage: beverageName)
        }
    }
    
    func deleteInventory(beverageName: Beverage, number: Int) {
        for _ in 0..<number {
            inventoryBox.deleteBeverageStock(beverage: beverageName)
        }
    }
    
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfDrinksAvailable() -> [ObjectIdentifier: [Beverage]] {
        return inventoryBox.priceLessThan(coins: self.coins)
    }
    
    // 음료수를 구매하는 메소드
    func buyBeverage(beverageKey: ObjectIdentifier) {
        do {
            let beverageOfChoice = try inventoryBox.sellDrink(beverageKey: beverageKey)
            purchaseProductHistory.recordOfPurchaseHistory(date: Date(), beverage: beverageOfChoice.name)
            self.coins -= beverageOfChoice.price
        } catch {
            print("Beverage error")
        }
    }
    
    // 잔액을 확인하는 메소드
    func checkBalance () -> Int {
        return self.coins
    }
    
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showEntireInventory() -> [ObjectIdentifier: [Beverage]] {
        return inventoryBox.overallProductInventory()
    }
    
    // 유통기한이 지난 재고만 리턴하는 메소드
    func showOutOfStockInventory() -> [Beverage] {
        return inventoryBox.outOfStockInventory()
    }
    
    // 따뜻한 음료만 리턴하는 메소드
    func showHotDrinks() -> [Beverage] {
        return inventoryBox.hotDrinkInventory()
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showPurchaseProductHistory() -> [String] {
        return purchaseProductHistory.historyOfPurchase()
    }
    
    // menu type으로 해당 Beverage를 리턴해주는 메소드
    func choiceBeverageData(menuType: InventoryBox.InventoryMenu) -> Beverage {
        return inventoryBox.menuTypeToInventoryMenu(menuType: menuType)
    }
    
    func beverageNumberOf(menuType: InventoryBox.InventoryMenu) -> Int {
        return inventoryBox.countOfBeverage(menuType: menuType)
    }
    
    func typeSelector(tag: Int) -> InventoryBox.InventoryMenu {
        return inventoryBox.selectMenuType(tag: tag)
    }
    
}
