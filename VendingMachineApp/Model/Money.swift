//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/02.
//

import Foundation

class Money {
    private(set) var coins : Int
    
    init(){
        self.coins = 0
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
