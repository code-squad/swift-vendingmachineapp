//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    let stock: Stock
    private(set) var purchased: Beverages
    private(set) var balance: Money
    let beverageProductions: [(Date) -> (Beverage)] = [
        ChocolateMilk.produce,
        BananaMilk.produce,
        Coke.produce,
        Sprite.produce,
        Georgia.produce
    ]
    
    override init() {
        self.stock = Stock()
        self.purchased = Beverages()
        self.balance = Money()
    }
    
    required init?(coder: NSCoder) {
        self.stock = coder.decodeObject(forKey: .stock) as? Stock ?? Stock()
        self.purchased = coder.decodeObject(forKey: .purchased) as? Beverages ?? Beverages()
        self.balance = coder.decodeObject(forKey: .balance) as? Money ?? Money()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(object: stock, forKey: .stock)
        coder.encode(object: purchased, forKey: .purchased)
        coder.encode(object: balance, forKey: .balance)
    }
    
    func stockDictionary() -> [ObjectIdentifier: Beverages] {
        return stock.dictionary()
    }
    
    func forEachProductObjectIdentifier(_ handler: (ObjectIdentifier, _ index: Int) -> ()) {
        beverageProductions.enumerated().forEach { (index, productionClosure) in
            let identifier = productionClosure(Date()).objectIdentifier()
            handler(identifier, index)
        }
    }
    
    @discardableResult func putMoney(_ amount: Int) -> Money {
        let money = Money(amount)
        balance.add(money: money)
        return balance
    }
    
    func addToStock(index: Int) {
        let beverage = beverageProductions[index](Date())
        stock.enqueue(beverage: beverage)
    }
    
    func numberOfBeverage(_ beverage: Beverage) -> Int {
        return stock.numberOf(beverage)
    }
    
    func availableBeverages() -> Set<Beverage> {
        var availableBeverages: Set<Beverage> = []
        beverageProductions.forEach{
            guard balance > $0(Date()).price else { return }
            availableBeverages.insert($0(Date()))
        }
        return availableBeverages
    }
    
    func select(_ beverage: Beverage) {
        guard beverage.isPurchasable(with: balance) && stock.numberOf(beverage) > 0 else { return }
        balance.subtract(money: beverage.price)
        stock.dequeue(beverage: beverage)
        purchased.enqueue(beverage: beverage)
    }
}
