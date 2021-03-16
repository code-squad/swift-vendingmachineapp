//
//  MoneyManagable.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol MoneyManagable {
    
    func update(amount: Int)
    
    func update(to money: Int)
    
    func balance() -> Int
    
    func affordables(fromItemsIn storage: Storage) -> [ObjectIdentifier]
}
