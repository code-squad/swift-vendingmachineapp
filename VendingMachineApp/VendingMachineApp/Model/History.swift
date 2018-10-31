//
//  History.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History: NSObject, NSSecureCoding {
    private var beverage: Beverage
    private var date: Date
    static var supportsSecureCoding: Bool {
        return true
    }
    
    init(beverage: Beverage, date: Date) {
        self.beverage = beverage
        self.date = date
    }
    
    required init?(coder aDecoder: NSCoder) {
        beverage = aDecoder.decodeObject(forKey: "beverage") as! Beverage
        date = aDecoder.decodeObject(forKey: "date") as! Date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(beverage, forKey: "beverage")
        aCoder.encode(date, forKey: "date")
    }

}
