//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let balanceKey: String = "balance"
    private let productsKey: String = "products"
    private let historyOfPurchaseKey: String = "historyOfPurchase"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: self.balanceKey)
        aCoder.encode(products, forKey: self.productsKey)
        aCoder.encode(historyOfPurchase, forKey: self.historyOfPurchaseKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        balance = aDecoder.decodeObject(forKey: self.balanceKey) as! Balance
        products = aDecoder.decodeObject(forKey: self.productsKey) as! Products
        historyOfPurchase = aDecoder.decodeObject(forKey: self.historyOfPurchaseKey) as! HistoryOfPurchase
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var balance: Balance
    private var products: Products
    private var historyOfPurchase: HistoryOfPurchase

    //MARK: Type
    
    static let sharedInstance = VendingMachine()
    
    //MARK: Initialize
    
    override private init() {
        self.balance = Balance()
        self.products = Products()
        self.historyOfPurchase = HistoryOfPurchase()
    }
    
    //MARK: - Methods
    //MARK: Balance
    
    func insert(money: Money) {
        balance.insert(money: money)
    }
    
    func updateBalance(update: (String) -> Void) {
        balance.updateBalance(update: update)
    }

    //MARK: Products
    
    func add(product: Beverage) {
        products.add(product: product)
    }

    func buy(productType: Beverage.Type) -> Beverage? {
        
        guard let isBuyable = products.isBuyable(productType),
        balance.isBuyable(isBuyable) else { return nil }
        guard let boughtProduct = products.buy(productType: productType) else { return nil }
        balance.pay(beverage: boughtProduct)
        historyOfPurchase.add(beverage: boughtProduct)
        return boughtProduct
    }
    
    func updateNumber(of beverageType: Beverage.Type, update: (Int) -> Void) {
        products.updateNumber(of: beverageType, update: update)
    }
    
    //MARK: HistoryOfPurchase
    
    func addHistoryOfPurchaseImageViews(_ addHistoryOfPurchaseImageViews: ([Beverage]) -> Void) {
        self.historyOfPurchase.addHistoryOfPurchaseImageViews(addHistoryOfPurchaseImageViews)
    }
    
    //MARK: - Get Properties Method
    
    func property(of vendingMachine: VendingMachine) {
        self.balance = vendingMachine.balance
        self.products = vendingMachine.products
        self.historyOfPurchase = vendingMachine.historyOfPurchase
    }
}
