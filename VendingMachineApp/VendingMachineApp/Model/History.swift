//
//  History.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 2019/11/20.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

class History: NSObject, NSCoding {
    var beverages: [Beverage] = []
    
    override init() { }
    
    enum Keys: String {
        case beverages = "Beverages"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverages, forKey: Keys.beverages.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: Keys.beverages.rawValue) as! [Beverage]
    }
}

extension History {
    func append(_ element: Beverage) {
        beverages.append(element)
    }
}


