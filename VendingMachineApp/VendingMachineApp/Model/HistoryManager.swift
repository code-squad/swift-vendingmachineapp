//
//  HistoryManager.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 10..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class HistoryManager: NSObject, NSSecureCoding {
    private var purchased: [Beverage]
    
    override init() {
        self.purchased = []
        super.init()
    }
    
    func addPurchased(_ beverage: Beverage) {
        self.purchased.append(beverage)
    }
    
    // MARK: NSSecureCoding
    private struct NSCoderKeys {
        static let purchasedKey = "purhcased"
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchased, forKey: NSCoderKeys.purchasedKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoded = aDecoder.decodeObject(of: NSArray.self, forKey: NSCoderKeys.purchasedKey), let purchased = decoded as? [Beverage] else {
            return nil
        }
        self.purchased = purchased
        super.init()
    }
}
