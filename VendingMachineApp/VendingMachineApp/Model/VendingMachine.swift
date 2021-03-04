//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class VendingMachine {
    
    private var beverages: Beverages
    private var money: Money
    private var purchasedList: Beverages
    
    init() {
        self.beverages = Beverages()
        self.money = Money()
        self.purchasedList = Beverages()
    }
    
    // 재고를 추가하는 메소드
    func addStock(beverage: Beverage) -> Beverage{
        beverages.addBeverage(beverage: beverage)
        return beverage
    }
    
    // 현재 금액으로 구매 가능한 음료수 목록을 리턴하는 메소드
    func showAvailableBeverage() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.retrieveBeverage(completion: {
            if $0.availableBeverage(currentAmount: money.showCurrentAmount()){
                availableList.append($0)
            }
        })
        return availableList
    }
    
    // 음료수를 구매하는 메소드
    func buyBeverage(beverage: Beverage)  {
        if beverage.availableBeverage(currentAmount: money.showCurrentAmount()) {
            money.decreaseAmount(price: beverage.price)
            purchasedList.addBeverage(beverage: beverage)
            beverages.removeBeverage(beverage: beverage)
        }
    }
    
}
