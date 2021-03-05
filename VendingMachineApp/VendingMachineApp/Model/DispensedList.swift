//
//  DispensedList.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/05.
//

import Foundation

class DispensedList {
    
    private(set) var items: [Beverage]
    
    init() {
        items = []
    }
    
    func update(soldItem: Beverage) {
        items.append(soldItem)
    }
}
