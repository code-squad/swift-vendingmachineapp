//
//  VendingMachineProtocols.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol CommonInterface {
    
    func allStocks() -> [ObjectIdentifier: Int]
}

protocol UserInterface: CommonInterface {
    
    func insert(money: Int)
    
    func moneyLeft() -> Int
    
    func buy(itemType: Shopable.Type)
    
    func purchased() -> [Shopable]
}

protocol WorkerInterface: CommonInterface {
    
    func addStock(of itemType: Shopable.Type)
    
}

protocol Curatable {
    
    func affordables() -> [ObjectIdentifier]
    
    func expiredItems() -> [ObjectIdentifier: [Shopable]]
    
    func hotItems() -> [ObjectIdentifier]
    
    func transportables() -> [ObjectIdentifier]
    
    func healthyItems() -> [ObjectIdentifier]
}
