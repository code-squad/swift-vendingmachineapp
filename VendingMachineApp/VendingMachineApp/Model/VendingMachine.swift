//
//  BeverageSKU.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    
    private var inventoryList = [Beverage]()
    private var account = Int()
    private var purchaseHistory = [Beverage]()
    
    static let updateAccount = Notification.Name("updateAccount")
    static let updateQuantity = Notification.Name("updateQuantity")
    static let historyChanged = Notification.Name("historyChanged")
    
    init(inventoryList: [Beverage], account: Int, purchaseHistory: [Beverage]) {
        self.inventoryList = inventoryList
        self.account = account
        self.purchaseHistory = purchaseHistory
    }
    
    override init() {
        self.inventoryList = [Beverage]()
        self.account = Int()
        self.purchaseHistory = [Beverage]()
    }

    required init?(coder: NSCoder) {
        self.inventoryList = coder.decodeObject(forKey: "inventoryList") as! [Beverage]
        self.account = coder.decodeInteger(forKey: "account")
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as! [Beverage]
    }

    func encode(with coder: NSCoder) {
        coder.encode(inventoryList, forKey: "inventoryList")
        coder.encode(account, forKey: "account")
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
    }
    
    // 현금 투입
    public func addCash(cash: Int) {
        self.account += cash
        NotificationCenter.default.post(name: VendingMachine.updateAccount, object: self)
    }
    
    // 앞서 현금 투입 함수가 있지만, 개인적으로 정리할 내용이 있어 남겨뒀습니다.
    // Test에 내용을 다시 남기겠습니다.
    public func insertCash(cash: Int) -> Int {
        return account + cash
    }
    
    // 재고 추가
    public func addBeverage(beverage: Beverage) {
        inventoryList.append(beverage)
        NotificationCenter.default.post(name: VendingMachine.updateQuantity, object: self)
    }
    
    // 구매 가능 음료 목록
    public func showPurchasable() -> [Beverage] {
        return inventoryList.filter( {$0.showPrice() <= account} )
    }
    
    // 특정 음료 제거, Equtable?
    public func remove(one: Beverage) {
        if let index = inventoryList.firstIndex(where: { ObjectIdentifier(type(of: $0)) == ObjectIdentifier(type(of: one)) } ) {
            inventoryList.remove(at: index)
        }
        NotificationCenter.default.post(name: VendingMachine.updateQuantity, object: self)
    }
    
    // 음료 구매
    public func sell(one : Beverage) {
        purchaseHistory.append(one)
        NotificationCenter.default.post(name: VendingMachine.historyChanged, object: self)
    }
    
    // 잔액 확인
    public func showAccount() -> Int {
        return account
    }
    
    // 전체 재고 확인
    public func showInventory() -> [Beverage] {
        return inventoryList
    }
    
    // 유통기한 만료 제품
    public func showExpired() -> [Beverage] {
        return inventoryList.filter( { $0.isNotExpired() == false } )
    }
    
    // 따뜻한 음료만 배열로
    public func hotBeverage() -> [Beverage] {
        let hotBeverage = inventoryList.filter{ sku in
            if let coffee = sku as? Coffee {
                if coffee.hot() {
                    return true
                }
            }
            return false
        }
        return hotBeverage
    }
    
    // 시작 이후 구매 상품 이력을 배열로
    public func showHistory() -> [Beverage] {
        return purchaseHistory
    }
    
    // 특정 음료 재고량 확인 함수
    public func countSKUQuantity<T>(_: T.Type) -> Int {
        return inventoryList.compactMap({ (element) in
            return element as? T
        }).count
    }
    
    // ObjectIdentifier를 활용한 특정 음료 재고량 확인
    public func count<T>(sku: T.Type) -> Int {
        return inventoryList.filter( { (SKU) in
            return ObjectIdentifier(type(of: SKU)) == ObjectIdentifier(sku)
        } ).count
    }
    
    public func countQuantity() -> Dictionary<ObjectIdentifier, [Beverage]> {
        var dict = Dictionary<ObjectIdentifier, [Beverage]>()
        for sku in inventoryList {
            let key = ObjectIdentifier(type(of: sku))
            if (dict[key] != nil) {
                dict[key]?.append(sku)
            } else {
                dict[key] = [sku]
            }
        }
        return dict
    }
    
}
