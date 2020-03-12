//
//  Money.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Money {
    
    private var coin: Int = 0
    var balance: Int {
        coin
    }
    
    public mutating func insert(_ coin: Int) {
        self.coin += coin
    }
    
    public func valid(_ coin: Int) -> Bool {
        self.coin > coin
    }
    
    public mutating func balance(_ coin: Int) {
        self.coin -= coin
    }
}


