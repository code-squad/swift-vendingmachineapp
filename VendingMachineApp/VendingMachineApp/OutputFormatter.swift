//
//  OutputFormatter.swift
//  VendingMachineApp
//
//  Created by 김성현 on 16/07/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import Foundation

class OutputFormatter {
    
    func nameWithCount(name: String, count: Int) -> String {
        return "\(name)(\(count)개)"
    }
    
    func inventory(_ inventory: [String: Beverages]) -> String {
        var inventoryInfo = [String]()
        inventory.forEach { (name, beverages) in
            inventoryInfo.append(nameWithCount(name: name, count: beverages.count))
        }
        return inventoryInfo.joined(separator: " ")
    }
}
