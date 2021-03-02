//
//  MoneyBox.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

class MoneyBox {
    
    private var money: Int
    
    init() {
        money = 0
    }
    
    //이렇게 리턴하지 않고 잔액을 받아올 수 있는 방법을 모르겠습니다ㅠㅠ
    func balance() -> Int {
        return money
    }
    
    func update(amount: Int) {
        money += amount
    }
    
    func update(to money: Int) {
        self.money = money
    }
    
    func affordableList(from list: Beverages) -> [Beverage] {
        return list.listTypeOnly(filter: affordable(_:))
    }
    
    private func affordable(_ beverages: [Beverage: Int]) -> [Beverage] {
        var purchashableList = [Beverage]()
        
        beverages.forEach { (beverage: Beverage, _: Int) in
            if beverage.isPurchashable(with: money){
                purchashableList.append(beverage)
            }
        }
        return purchashableList
    }
}
