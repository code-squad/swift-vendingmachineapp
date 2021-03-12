//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/02.
//

import Foundation

class Money : NSObject, NSCoding {
    
    private(set) var coins : Int
    
    required convenience init?(coder: NSCoder) {
        let coin = coder.decodeInteger(forKey: "coin")
        self.init(coin)
    }
    init(_ coin : Int = 0){
        self.coins = coin
    }
    func encode(with coder: NSCoder) {
        coder.encode(coins, forKey: "coin")
    }
    public func add(with coin : Int){
        self.coins += coin
    }
    public func minus(with coin : Int){
        self.coins -= coin
    }
    public func resetCoins() -> Int{
        let remain = coins
        coins = 0
        return remain
    }
}
