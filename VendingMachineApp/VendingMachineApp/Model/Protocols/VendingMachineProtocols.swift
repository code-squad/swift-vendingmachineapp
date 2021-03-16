//
//  VendingMachineProtocols.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol UserInterface {
    
    func insert(money: Int)
    
    func moneyLeft() -> Int
    
    func buy(itemType: Shopable.Type)
    
}

protocol WorkerInterface {
    
    func addStock(of itemType: Shopable.Type)
    
    func allStocks() -> [ObjectIdentifier: Int]
    
    func purchased() -> [Shopable]
    
}

protocol Curatable {
    
    func affordables() -> [ObjectIdentifier]
    
    func expiredItems() -> [ObjectIdentifier: Int] //[ob: [Shopable]]
    
    func hotItems() -> [ObjectIdentifier]
    
    func transportables() -> [ObjectIdentifier]
    
    func healthyItems() -> [ObjectIdentifier]
}
