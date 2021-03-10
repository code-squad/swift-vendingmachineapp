//
//  Consumer.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Customer {
    
    private(set) var coins : Int
    private var purchaseList : [Beverage]
    
    init(coins : Int = 0){
        self.coins = coins
        self.purchaseList = [Beverage]()
    }
    
    func buy(type : Beverage.Type, from vendingMachine : VendingMachine) -> Bool{
        if let product = vendingMachine.sellProduct(with: type){
            purchaseList.append(product)
            return true
        }
        return false
    }
    func putCoinsToVendingMachine(with coins : Int){
        self.coins -= coins
    }
    func takeBalance(from vendingMachine : VendingMachine){
        coins += vendingMachine.returnCoins()
    }
}
