//
//  DispensedList.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/05.
//

import Foundation

class DispensedList: NSObject, OrderableList, NSCoding {
    
    private var items: [Shopable]
    
    override init() {
        items = []
    }
    
    enum Keys {
        static let soldItems = "soldItems"
    }
    
    required init?(coder: NSCoder) {
        self.items = coder.decodeObject(forKey: Keys.soldItems) as? [Shopable] ?? [Shopable]()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(items, forKey: Keys.soldItems)
    }

    func push(item: Shopable) {
        items.append(item)
    }
    
    func listByOrder() -> [Shopable] {
        return items
    }
}
