//
//  Keywords.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 12..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Keyword {
    enum Key : String {
        case inventory = "inventory"
        case balance = "balance"
        case didUpdateInventory = "didUpdateInventory"
        case didUpdateBalance = "didUpdateBalance"
        case didUpdateListOfPurchase = "didUpdateListOfPurchase"
        case productImg = "ProductImg"
    }
    
    enum Img : String {
        case strawberryMilk = "StrawberryMilk.jpg"
        case bananaMilk = "BananaMilk.jpg"
        case pepciCoke = "PepciCOke.jpg"
        case fanta = "Fanta.jpg"
        case topCoffee = "TOP.jpg"
        case georgia = "Georgia.jpg"
    }
}

extension Notification.Name {
    static let didUpdateInventory = Notification.Name(Keyword.Key.didUpdateInventory.rawValue)
    static let didUpdateBalance = Notification.Name(Keyword.Key.didUpdateBalance.rawValue)
    static let didUpdateListOfPurchase = Notification.Name(Keyword.Key.didUpdateListOfPurchase.rawValue)
}
