//
//  Slot.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class Slot: CustomStringConvertible {
    
    private var items: [Beverage]
        var itemCount: Int {
            return items.count
        }
        private var firstItem: Beverage? {
            return items.first
        }
        var description: String {
            guard let firstItemName = firstItem?.name else {
                return "Empty Slot"
            }
            return firstItemName
        }
        
        init(items: [Beverage]) {
            self.items = items
        }
        
        convenience init() {
            self.init(items: [])
        }
}
