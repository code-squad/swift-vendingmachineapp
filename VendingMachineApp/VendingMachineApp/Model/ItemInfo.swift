//
//  ItemInfo.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 02/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

// MARK: ItemDTO

struct ItemInfo {
    let name: String
    let price: Int
    let count: Int
    let imageName: String
}

extension Array where Element == ItemInfo {
    func fetchInfo(at index: Int) -> Element? {
        guard index < self.count && index > -1 else {
            return nil
        }
        return self[index]
    }
}
