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
    public func appendInventory(_ beverage: Beverage) {
        inventory.append(beverage)
    }
    
    //현재 금액으로 구매가능한 음료수 목록을 리턴하는 기능
    public func beverageListForPurchase() -> [Beverage] {
        return inventory.buyableBeverageList(buyer: paymentManager)
    }
    
    //자판기 금액을 원하는 금액만큼 올리는 기능
    public func put(in money: Money) {
        paymentManager.increase(money)
    }
    
    //음료수를 구매하는 기능
    public func buy(_ beverageType: Beverage.Type) {
        guard let beverage = inventory.take(out: beverageType, for: paymentManager) else { return }
        purchaseHistory.append(item: beverage)
    }
    
    //잔액을 확인하는 기능
    public func showCurrentMoney() -> Int {
        return paymentManager.money
    }
    
    //전체 상품 재고를 종류별로 리턴하는 기능
    public func showAllBeverageList() -> [ObjectIdentifier: [Beverage]] {
        return inventory.showAllBeverageList()
    }
    
    //유통기한이 지난 재고만 리턴 하는 기능
    public func showExpiryDateBeverage(over standard: Date) -> [SafeDateChecker] {
        return inventory.showExpiryDateBeverage(over: standard)
    }
    
    //따뜻한 음료만 리턴하는 기능
    public func showHotBeverage(over standard: Int) -> [Hotable] {
        return inventory.showHotBeverage(over: standard)
    }
    
    //구매이력 확인 기능
    public func showPurchaseHistory() -> [Beverage] {
        return purchaseHistory.beverages
    }
}
