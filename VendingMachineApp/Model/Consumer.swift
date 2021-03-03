//
//  Consumer.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Consumer {
    
    private(set) var coins : Int
    private var purchaseList : [Beverage]
    
    init(coins : Int = 0){
        self.coins = coins
        self.purchaseList = [Beverage]()
    }
    
/*
    func buy(with name : String, from vendingMachine : VendingMachine) -> Bool{
        if let product = vendingMachine.sellProduct(with: name) {
            purchaseList.append(product)
            return true
        }
        return false
    }*/
    func putCoinsToVendingMachine(with coins : Int){
        self.coins -= coins
    }
    func takeBalance(from vendingMachine : VendingMachine){
        coins += vendingMachine.returnCoins()
    }
}
