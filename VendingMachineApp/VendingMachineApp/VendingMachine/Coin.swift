//
//  Coin.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Coin {
    private var coin: Int = 0
    
    func add(_ coin: Int) {
        self.coin += coin
    }
    
    func minus(_ coin: Int) {
        self.coin -= coin
    }
    
    func isEnoughToBuy(of price: Int) -> Bool {
        return coin >= price
    }
    
    func convertToString() -> String {
        return "\(coin)"
    }
}
