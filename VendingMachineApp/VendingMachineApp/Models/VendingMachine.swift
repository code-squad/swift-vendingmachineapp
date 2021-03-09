//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private let stock: Stock
    private let cashier: Cashier
    private let purchaseHistory: PurchaseHistory
    
    init() {
        stock = Stock()
        cashier = Cashier()
        purchaseHistory = PurchaseHistory()
    }
    
    func add(type: BeverageType, expireDate: String){
        switch type {
        case .BananaMilk:
            stock.add(beverage: BananaMilk(expireDate: expireDate))
        case .ChocoMilk:
            stock.add(beverage: ChocoMilk(expireDate: expireDate))
        case .Americano:
            stock.add(beverage: Americano(expireDate: expireDate))
        case .CaffeLatte:
            stock.add(beverage: CaffeLatte(expireDate: expireDate))
        case .Coke:
            stock.add(beverage: Coke(expireDate: expireDate))
        case .EnergyDrink:
            stock.add(beverage: EnergyDrink(expireDate: expireDate))
        }
    }
    
    func insert(money: Int) {
        cashier.insert(money: money)
    }
    
    func purchase(beverage: Beverage) -> Beverage {
        
        purchaseHistory.add(beverage: beverage)
        return cashier.purchase(beverage: beverage, stock: stock)
    }
    
    func showAllStock() -> [Beverage:Int] {
        return stock.getAllStock()
    }
    
    func showPurchasableBeverages() -> [Beverage] {
        return cashier.getPurchasableBeverages(with: stock)
    }
    
    func showExpiredBeverages() -> [Beverage] {
        return stock.expiredBeverages()
    }
    
    func showHotBeverages() -> [Beverage] {
        return stock.hotBeverages()
    }
    
    func showPurchaseHistory() -> [Beverage] {
        var history = [Beverage]()
        purchaseHistory.show {
            history.append($0)
        }
        return history
    }
    
    func showBalance() -> Int {
        return cashier.moneyDeposited
    }
}


