//
//  DispensedList.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/05.
//

import Foundation

class DispensedList: OrderableList {
    
    private var items: [Shopable]
    
    init() {
        items = []
    }
    
    func push(item: Shopable) {
        items.append(item)
    }
    
    func listByOrder() -> [Shopable] {
        return items
    }
}
