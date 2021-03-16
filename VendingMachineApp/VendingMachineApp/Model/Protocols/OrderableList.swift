//
//  OrderableList.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol OrderableList {
    
    func push(item: Shopable)
    
    func listByOrder() -> [Shopable]
}
