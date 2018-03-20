//
//  History.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 2..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct History {
    private var purchase = [Beverage]()
    private var supply =  [Beverage]()

    init() {}

    init(_ purchase: [Beverage], _ supply: [Beverage]) {
        self.purchase = purchase
        self.supply = supply
    }

    mutating func addPurchaseLog(_ item: Beverage) {
        self.purchase.append(item)
    }

    mutating func addSupplyLog(_ item: Beverage) {
        self.supply.append(item)
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

}
