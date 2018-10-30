//
//  Bundles.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BeverageBundle: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(list, forKey: "list")
    }
    
    required init?(coder aDecoder: NSCoder) {
        list = aDecoder.decodeObject(forKey: "list") as! [Beverage]
    }
    
    private var list: [Beverage]
    
    var beverage: Beverage {
        return list.first!
    }
    
    var count: Int {
        return list.count
    }
    
    init(list: [Beverage]) {
        self.list = list
    }
    
    func contains(_ beverage: Beverage) -> Bool {
        return list.contains(beverage)
    }
}
