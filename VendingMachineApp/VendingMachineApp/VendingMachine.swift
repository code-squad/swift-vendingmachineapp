//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    
    //MARK: - encode, decode
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: VendingMachineArchiveKey.balance)
        aCoder.encode(products, forKey: VendingMachineArchiveKey.products)
        aCoder.encode(historyOfPurchase, forKey: VendingMachineArchiveKey.historyOfPurchase)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        balance = aDecoder.decodeInteger(forKey: VendingMachineArchiveKey.balance) as! Balance
        products = aDecoder.decodeObject(forKey: VendingMachineArchiveKey.products) as! Product
        historyOfPurchase = aDecoder.decodeObject(forKey: VendingMachineArchiveKey.historyOfPurchase) as! HistoryOfPurchase
    }
    
    //MARK: - Properties
    private var balance: Balance = Balance()
    private var products: Products = Products()
    private var historyOfPurchase: HistoryOfPurchase = HistoryOfPurchase()

    //MARK: - Methods
    //MARK: Balance
    func insert(money: Money) {
        balance.insert(money: money)
    }
    
    func readBalance() -> String {
        return balance.readBalance()
    }

    //MARK: Products
    func add<T>(product: T) where T: Beverage, T: Product {
        products.add(product: product)
    }

    func buy(tag: Int) -> Beverage? {
        guard let boughtProduct = products.buy(tag: tag) else {
            return nil
        }
        balance.pay(beverage: boughtProduct)
        historyOfPurchase.add(beverage: boughtProduct)
        return boughtProduct
    }
    
    func number(of tag: Int) -> Int {
        return products.number(of: tag)
    }
    
    func inventory() -> [String: Int] {
        return products.inventory()
    }

    func expiredProducts() -> [Beverage] {
        return products.expiredProducts()
    }

    func hotProducts() -> [String] {
        return products.hotProducts()
    }
    
    //MARK: - Get Properties Method
    func property(of vendingMachine: VendingMachine) {
        self.balance = vendingMachine.balance
        self.products = vendingMachine.products
        self.historyOfPurchase = vendingMachine.historyOfPurchase
    }
}
