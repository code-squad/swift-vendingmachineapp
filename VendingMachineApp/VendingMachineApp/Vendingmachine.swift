//
//  Vendingmachine.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Vendingmachine: NSObject, AdminVendingmachine, UserVendingmachine, NSSecureCoding, CountKinds {

    private var balance: Int = 0
    private var inventory: [String: [Beverage]] = [:]
    private var purchases: [Beverage] = []
    private static let beverages = [
        Coke(), Coke(), Coke(),
        ChocoMilk(), ChocoMilk(), ChocoMilk(),
        StrawberryMilk(), StrawberryMilk(), StrawberryMilk(),
        Top(), Top(), Top(),
        Sprite(), Sprite(), Sprite()
    ]
    
    init(_ beverageSet: [Beverage]) {
        super.init()
        for item in beverageSet {
            addPurchases(item)
        }
    }
    
    private static var vendingmachineInstance: Vendingmachine = Vendingmachine(beverages)
    
    class func sharedInstance() -> Vendingmachine {
        return self.vendingmachineInstance
    }
    
    class func loadInstance(_ vendingmachine: Vendingmachine) {
        vendingmachineInstance = vendingmachine
    }
    
    private struct NSCoderKeys {
        static let balance = "balance"
        static let inventory = "inventory"
        static let purchases = "purchases"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(NSNumber(value: balance), forKey: NSCoderKeys.balance)
        aCoder.encode(inventory as NSDictionary, forKey: NSCoderKeys.inventory)
        aCoder.encode(purchases, forKey: NSCoderKeys.purchases)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let balance = aDecoder.decodeObject(of: NSNumber.self, forKey: NSCoderKeys.balance) else {
            return nil
        }
        guard let inventory = aDecoder.decodeObject(of: NSDictionary.self, forKey: NSCoderKeys.inventory) else {
            return nil
        }
        guard let purchases = aDecoder.decodeObject(of: NSArray.self, forKey: NSCoderKeys.purchases) else {
            return nil
        }
        
        self.balance = balance.intValue
        for (key, value) in inventory {
            guard let key = key as? String else { continue }
            guard let value = value as? [Beverage] else { continue }
            self.inventory[key] = value
        }
        
        for beverage in purchases {
            if let beverage = beverage as? Beverage {
                self.purchases.append(beverage)
            }
        }
    }

    subscript(item: String) -> [Beverage]? {
        return self.inventory[item]
    }
    
    /* 사용자 */
    
    //자판기 금액을 원하는 금액만큼 올리는 메소드
    func addBalance(_ inputMoney: Int) {
        self.balance += inputMoney
        NotificationCenter.default.post(name: .didUpdateBalance, object: balance)
    }

    //특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addPurchases(_ beverage: Beverage) {
        self.inventory[beverage.kind, default: []].append(beverage)
        NotificationCenter.default.post(name: .didUpdateInventory, object: inventory)
    }
    
    //현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func buyableOfList() -> [String] {
        return self.inventory.filter({$0.value.count > 0}).filter({($0.value[0].price) <= self.balance}).map({$0.key})
    }
    
    //음료수를 구매하는 메소드
    func buyBeverage(_ beverage: String) {
        let soldBeverage = self.inventory[beverage]?.removeFirst()
        guard let beverage = soldBeverage else { return }
        self.purchases.append(beverage)
        let price = beverage.price
        self.balance -= price
    }
    
    //잔액을 확인하는 메소드
    func checkBalance() -> Int {
        return self.balance
    }

    //전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func checkInventory() -> [String: [Beverage]] {
        return self.inventory.filter({$0.value.count > 0})
    }

    //유통기한이 지난 재고만 리턴하는 메소드
    func checkInvalid() -> [Beverage] {
        var invalidBeverages: [Beverage] = []
        for beverages in self.inventory.values {
            invalidBeverages += beverages.filter({$0.isValidate(Date())})
        }
        return invalidBeverages
    }

    //따뜻한 음료만 리턴하는 메소드
    func checkHotBeverage() -> [Beverage] {
        var hotBeverages: [Beverage] = []
        for beverages in self.inventory.values {
            let coffee = beverages.compactMap({$0 as? Coffee}).filter({$0.isHot()})
            hotBeverages.append(contentsOf: coffee)
        }
        return hotBeverages
    }

    //시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func checkPurchases() -> [Beverage] {
        return self.purchases
    }
    
    //특정 음료의 재고를 리턴하는 메소드
    func countOfInventory(_ kind: String) -> Int {
        return inventory[kind]?.count ?? 0
    }
    
    //음료의 가격을 리턴하는 메소드
    func makePriceOfBeverage(_ kind: String) -> Int {
        guard let price = self.inventory[kind]?.first?.price else {
            return 0
        }
        return price
    }

    //음료의 종류를 리턴하는 메소드
    func makeKindOfBeverage() -> [String] {
        var kind: [String] = []
        for item in self.inventory.values {
            kind.append(item.first?.kind ?? "")
        }
        return kind
    }
    
    /* 관리자 */
    //재고를 삭제하는 메소드
    func removeInventory(_ beverage: String) {
        self.inventory[beverage]?.removeFirst()
    }

}

protocol AdminVendingmachine {
    func removeInventory(_ beverage: String)
    func makeKindOfBeverage() -> [String]
    func addPurchases(_ beverage: Beverage)
    subscript(item: String) -> [Beverage]? { get }
}

protocol UserVendingmachine {
    func addBalance(_ inputMoney: Int)
    func addPurchases(_ beverage: Beverage)
    func buyableOfList() -> [String]
    func buyBeverage(_ beverage: String)
    func checkBalance() -> Int
    func checkPurchases() -> [Beverage]
    func makePriceOfBeverage(_ kind: String) -> Int
    func makeKindOfBeverage() -> [String]
    subscript(item: String) -> [Beverage]? { get }
}

protocol CountKinds {
    func countOfInventory(_ kind: String) -> Int
}

extension Notification.Name {
    static let didUpdateBalance = Notification.Name("didUpdateBalance")
    static let didUpdateInventory = Notification.Name("didUpdateInventory")
}
