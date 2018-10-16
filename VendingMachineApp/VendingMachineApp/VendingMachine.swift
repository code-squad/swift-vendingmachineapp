//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

protocol Common {
    func stockList() -> [[Beverage]]?
}

protocol Userable: Common {
    func remove(target: Int) -> Beverage?
    func addBalance(value: Int)
    func presentBalance() -> Int
    func historyList() -> [Beverage]
    func isAvailablePurchase(target: Int, balance: Int) throws -> Bool
}

protocol Manageable: Common {
    var status: String { get set }
    func addStock(with addBeverages: [Beverage]) -> [Beverage]
    func removeStock(target: Int, amount: Int) -> [Beverage]
    func expiredBeverages() throws -> [[Beverage: Int]]
    func expiredBeverage(with beverages: [Beverage]) -> [Beverage: Int]?
    func removeExpiredBeverage(with expiredBeverages: [[Beverage: Int]]) throws -> [Beverage]
}

class VendingMachine: NSObject, NSSecureCoding, Userable, Manageable {
    static let shared = VendingMachine()
    
    static var supportsSecureCoding: Bool {
        return true
    }
    private var beverages: [[Beverage]]
    private var cash = Cash()
    private var history = History()
    public var status = ""
    public var xValue = 40
    public var yValue = 657
    public let maxValue = 1000
    
    convenience override private init() {
        self.init(with: Stock.prepareStock())
    }
    
    private init(with beverages: [[Beverage]]) {
        self.beverages = beverages
    }
    
    func settingDefault(with vendingMachine: VendingMachine) {
        self.beverages = vendingMachine.beverages
        self.cash = vendingMachine.cash
        self.history = vendingMachine.history
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.beverages, forKey: "beverages")
        aCoder.encode(self.cash, forKey: "cash")
        aCoder.encode(self.history, forKey: "history")
        aCoder.encode(self.status, forKey: "status")
    }
    
    required init?(coder aDecoder: NSCoder) {
        // as? 캐스팅 하면 Property 'self.beverages' not initialized at implicitly generated super.init call 에러 발생
        self.beverages = aDecoder.decodeObject(forKey: "beverages") as! [[Beverage]]
        if let cash = aDecoder.decodeObject(forKey: "cash") as? Cash {
            self.cash = cash
        }
        if let history = aDecoder.decodeObject(forKey: "history") as? History {
            self.history = history
        }
        if let status = aDecoder.decodeObject(forKey: "status") as? String {
            self.status = status
        }
    }
    
    public func stockList() -> [[Beverage]]? {
        return self.beverages
    }
    
    public func remove(target index: Int) -> Beverage? {
        let beverage = self.beverages[index].removeFirst()
        
        self.cash.remove(with: beverage.beveragePrice())
        self.history.add(with: beverage)
        
        // 2차원 배열에서 빈배열의 경우 없애주기 위한 작업
        self.beverages = self.beverages.filter({$0.count > 0})
        
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.purchaseBeverage)
        NotificationCenter.default.post(name: name, object: nil, userInfo: ["Beverage": beverage])
        
        return beverage
    }
    
    public func addBalance(value: Int) {
        self.cash.addBalance(with: value)
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.addBalance)
        NotificationCenter.default.post(name: name, object: nil)
    }
    
    public func presentBalance() -> Int {
        return self.cash.presentBalance()
    }
    
    public func historyList() -> [Beverage] {
        return self.history.list()
    }
    
    public func isAvailablePurchase(target index: Int, balance: Int) throws -> Bool {
        guard index <= self.beverages.count else { throw InputError.rangeExceed }
        let result = beverages[index][0].isAvailablePurchase(with: balance)
        return result
    }
    
    public func addStock(with addBeverages: [Beverage]) -> [Beverage] {
        /*
         기존 리스트에 있는 음료
         self.beverages [[Beverage]] 안에 있는 [Beverage]에 값을 추가 할 수 없어서
         새로운 [Beverage]에 기존 [Beverage] 와 추가되는 [Beverage] 를 합쳐서
         self.beverages[index]의 값을 바꿔주는 형식으로 작성하였습니다.
         */
        var newBeverage = [Beverage]()
        for index in 0..<self.beverages.count where self.beverages[index][0].className == addBeverages[0].className {
            newBeverage = self.beverages[index]
            for addBeverage in addBeverages {
                newBeverage.append(addBeverage)
            }
            self.beverages[index] = newBeverage
            
            // 옵저버 알림
            let name = Notification.Name(NotificationKey.addStock)
            NotificationCenter.default.post(name: name, object: nil)
        }
        return newBeverage
    }
    
    public func removeStock(target: Int, amount: Int) -> [Beverage] {
        let index = target - 1
        var beverages = [Beverage]()
        for _ in 1...amount {
            beverages.append(self.beverages[index].removeFirst())
        }
        
        // 2차원 배열에서 빈배열의 경우 없애주기 위한 작업
        self.beverages = self.beverages.filter({$0.count > 0})
        
        return beverages
    }
    
    public func expiredBeverages() throws -> [[Beverage: Int]] {
        // 출력
        // 유통기한 지난 음료 리스트
        guard let stockList = self.stockList() else { throw MachineError.outOfStock }
        
        var expiredBeverages = [[Beverage: Int]]()
        var addIndex = 0
        for index in 0..<stockList.count {
            if let beverages = expiredBeverage(with: stockList[index]) {
                expiredBeverages.append(beverages)
                addIndex += 1
            }
        }
        
        guard expiredBeverages.count > 0 else { throw MachineError.outOfExpiredStock }
        return expiredBeverages
    }
    
    internal func expiredBeverage(with beverages: [Beverage]) -> [Beverage: Int]? {
        let today = Date(timeIntervalSinceNow: 0)
        var expiredBeverages = [Beverage: Int]()
        for index in 0..<beverages.count {
            if beverages[index].isExpirationDate(with: today) {
                expiredBeverages.updateValue(index, forKey: beverages[index])
            }
        }
        return expiredBeverages.count == 0 ? nil : expiredBeverages
    }
    
    public func removeExpiredBeverage(with expiredBeverages: [[Beverage: Int]]) throws -> [Beverage] {
        /*
         key : className 동일한 것 찾기
         value : index 찾아서 제거하기
         
         과정
         1. 재고목록을 복사합니다.
         2. 유통기한이 지난 음료와 재고목록과 비교하여 있는 경우 삭제합니다.
         3. 삭제할 때 뒤의 index 부터 삭제를 하기 위해 삭제해야 될 인덱스값 추출 후에 정렬하고 제거합니다.
         * : reverse 함수를 사용해보려 했으나 Dictionary는 정렬하는게 쉽지 않아서 값 추출 이후에 정렬하는 것으로 대체하였습니다.
         4. 변경된 재고목록으로 대체 저장합니다.
         */
        guard var stockList = self.stockList() else { throw MachineError.outOfStock }
        var removedExpiredBeverages = [Beverage]()
        for expiredIndex in 0..<expiredBeverages.count {
            for stockIndex in 0..<stockList.count {
                let expiredBeverageName = expiredBeverages[expiredIndex].map({ $0.key.beverageName() })[0]
                let stockBeverageName = stockList[stockIndex][0].beverageName()
                if expiredBeverageName == stockBeverageName {
                    var removeIndexList = [Int]()
                    for expiredBeverage in expiredBeverages[expiredIndex] {
                        let removeIndex = expiredBeverage.value
                        removeIndexList.append(removeIndex)
                    }
                    for removeIndex in removeIndexList.sorted(by: >) {
                        let beverage = stockList[stockIndex].remove(at: removeIndex)
                        removedExpiredBeverages.append(beverage)
                    }
                }
                
            }
        }
        
        self.beverages = stockList
        
        return removedExpiredBeverages
    }
}
