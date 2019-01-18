//
//  Coin.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Coin: NSObject, NSCoding {
    private var coins: Int = 0
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(coins, forKey: "coins")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.coins = aDecoder.decodeInteger(forKey: "coins")
    }
    
    func add(_ coin: Int) {
        self.coins += coin
    }
    
    func minus(_ coin: Int) {
        self.coins -= coin
    }
    
    func isEnoughToBuy(of price: Int) -> Bool {
        return coins >= price
    }
    
    func convertToString() -> String {
        return "\(coins)"
    }
}
