//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/13.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    private var vendingMachine: VendingMachine = VendingMachine(standard: Standard(32, 400))
    
    private func apply(index: Int) -> Beverage {
        switch index {
        case 0:
            return Cola(
                brand: .coca,
                weight: 130,
                price: 1500,
                name: "다이어트",
                expirationDate: Date().addingTimeInterval(20000),
                temperature: 12.00,
                calorie: 13,
                concentration: 34.00,
                sugar: 15
            )
        case 1:
            return Coffee(
                brand: .top,
                weight: 150,
                price: 2400,
                name: "카페모카",
                expirationDate: Date().addingTimeInterval(40000),
                temperature: 11.00,
                caffine: 32.00,
                calorie: 250,
                coffeeVarieties: .keyna
            )
        case 2:
            return Milk(
                brand: .namYang,
                weight: 120,
                price: 1200,
                name: "맛잇는 바나나 우유",
                expirationDate: Date().addingTimeInterval(15000),
                temperature: 12.00,
                calorie: 300,
                flavor: .banana
            )
        case 3:
            return Milk(
                brand: .nongSim,
                weight: 140,
                price: 1600,
                name: "초코에몽",
                expirationDate: Date().addingTimeInterval(14000),
                temperature: 11.00,
                calorie: 280,
                flavor: .choco
            )
        default:
            return Coffee(
                brand: .canTaTa,
                weight: 130,
                price: 2200,
                name: "프리미엄 카페모카",
                expirationDate: Date().addingTimeInterval(50000),
                temperature: 40.00,
                caffine: 23,
                calorie: 300,
                coffeeVarieties: .Ethiopia
            )
        }
    }
}

extension DataManager: VendingMachineDataSource {
    func load(coin: Int) {
        vendingMachine.insert(coin: coin)
        NotificationCenter
            .default
            .post(
                name: .vendingMachine,
                object: nil,
                userInfo: ["balance": vendingMachine.balance]
        )
    }
    
    func add(index: Int) {
        let beverage = apply(index: index)
        vendingMachine.add(product: beverage, amount: 1)
        let value = (index, vendingMachine.productCount(index: beverage))
        NotificationCenter
            .default
            .post(
                name: .vendingMachine,
                object: nil,
                userInfo: ["beverageCounts": value]
        )
    }
}
