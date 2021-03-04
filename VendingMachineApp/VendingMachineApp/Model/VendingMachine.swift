//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

struct VendingMachine {
  
    private var inventory: Inventory
    private var paymentManager: PaymentManager
    private var purchaseHistory: PurchaseHistory
    
    init() {
        self.inventory = Inventory()
        self.paymentManager = PaymentManager()
        self.purchaseHistory = PurchaseHistory()
    }
    
    //특정 상품 인스턴스를 넘겨서 재고를 추가하는 기능
    public func appendBeverage(_ beverage: Beverage) {
        inventory.appendBeverage(beverage)
    }
    
    //현재 금액으로 구매가능한 음료수 목록을 리턴하는 기능
    public func beverageListForPurchase() -> [Beverage] {
        return inventory.buyableBeverageList(buyer: paymentManager)
    }
    
    //자판기 금액을 원하는 금액만큼 올리는 기능
    public func putInMoney(_ money: Int) {
        paymentManager.putInMoney(money)
    }
    
    //음료수를 구매하는 기능
    public func buyBeverage(_ beverage: Beverage) {
        purchaseHistory.appendPurchaseHistory(beverage: inventory.takeOutBeverage(beverage, paymentManager: paymentManager))
    }
    
    //잔액을 확인하는 기능
    public func showCurrentMoney() -> Int {
        return paymentManager.money
    }
    
    //전체 상품 재고를 종류별로 리턴하는 기능
    public func showAllBeverageList() -> [Beverage: Int] {
        return inventory.showAllBeverageList()
    }
    
    //유통기한이 지난 재고만 리턴 하는 기능
    public func showExpiryDateBeverage() -> [SafeDateChecker] {
        return inventory.showExpiryDateBeverage()
    }
    
    //따뜻한 음료만 리턴하는 기능
    public func showHotBeverage() -> [Hotable] {
        return inventory.showHotBeverage()
    }
    
    //구매이력 확인 기능
    public func showPurchaseHistory() -> [Beverage] {
        return purchaseHistory.beverages.compactMap{ $0 }
    }
}
