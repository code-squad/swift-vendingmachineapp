//
//  FoodManagable.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol FoodManagable {
    
    func expiredItems(fromItemsIn storage: Storage) -> [ObjectIdentifier: [Shopable]]
    
    func hotItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func transportables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
    func healthyItems(fromItemsIn storage: Storage) -> [ObjectIdentifier]
    
}
