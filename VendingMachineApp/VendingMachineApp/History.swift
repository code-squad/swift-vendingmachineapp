//
//  History.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class History: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    private var beverages: [Beverage]
    
    override init() {
        self.beverages = [Beverage]()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.beverages = aDecoder.decodeObject(forKey: "beverages") as! [Beverage]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.beverages, forKey: "beverages")
    }
    
    public func add(with beverage: Beverage) {
        self.beverages.append(beverage)
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.purchaseBeverage)
        NotificationCenter.default.post(name: name, object: nil, userInfo: ["Beverage": beverage])
    }
    
    public func list() -> [Beverage] {
        return self.beverages
    }
}
