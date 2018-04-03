//
//  History.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 2..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class History: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchase, forKey: "purchase")
        aCoder.encode(supply, forKey: "supply")
    }

    required init?(coder aDecoder: NSCoder) {
        purchase = aDecoder.decodeObject(forKey: "purchase") as! [Beverage]
        supply = aDecoder.decodeObject(forKey: "supply") as! [Beverage]
    }

    private var purchase = [Beverage]()
    private var supply =  [Beverage]()

    override init() {}

    init(_ purchase: [Beverage], _ supply: [Beverage]) {
        self.purchase = purchase
        self.supply = supply
    }

    func addPurchaseLog(_ item: Beverage) {
        self.purchase.append(item)
    }

    func addSupplyLog(_ item: Beverage) {
        self.supply.append(item)
    }

    func lastPurchasedItem() -> (item: Beverage, index: Int?) {
        guard let lastItem = self.purchase.last else {
            return (Beverage(), nil)
        }
        return (lastItem, self.purchase.index(of: lastItem))
    }
    
    func log() -> String {
        var title = ""
        var log = ""
        if purchase.count != 0 {
            title = "< 구매 내역 > \n"
            log = purchase.map({ "\($0.type), \($0.price())원, \((Date().getDateWithLocalTime()))" }).joined(separator: "\n")
        } else {
            title = " >> 구매 내역이 없습니다. \n"
        }
        if supply.count != 0 {
            title += "\n< 입고 내역 > \n"
            log = supply.map({ "\($0.type), \($0.price())원, \((Date().getDateWithLocalTime()))" }).joined(separator: "\n")
        } else {
            title += " >> 입고 내역이 없습니다. \n"
        }
        return title+log
    }

    func purchaseLog() -> [Beverage] {
        return self.purchase
    }

}
