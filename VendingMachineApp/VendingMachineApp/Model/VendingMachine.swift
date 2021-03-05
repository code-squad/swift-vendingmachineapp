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
    private var purchasedList: [Beverage]
    
    init() {
        self.beverages = Beverages()
        self.money = Money()
        self.purchasedList = [Beverage]()
    }
    
    //MARK: 자판기 금액을 원하는 금액만큼 올리는 메소드
    func addMoney(additionalAmount: Int) {
        money.increaseAmount(additionalAmount: additionalAmount)
    }
    
    //MARK: 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addStock(beverage: Beverage) {
        beverages.addBeverage(beverage: beverage)
    }
    
    //MARK: 현재 금액으로 구매 가능한 음료수 목록을 리턴하는 메소드
    func showAvailableBeverage() -> [Beverage] {
        var availableList = [Beverage]()
        beverages.retrieveBeverage(completion: {
            if $0.availableBeverage(currentAmount: money.showCurrentAmount()){
                availableList.append($0)
            }
        })
        return availableList
    }
    
    //MARK: 음료수를 구매하는 메소드
    func buyBeverage(beverage: Beverage) -> Beverage  {
        if beverage.availableBeverage(currentAmount: money.showCurrentAmount()) {
            money.decreaseAmount(price: beverage.price)
            purchasedList.append(beverage)
            beverages.removeBeverage(beverage: beverage)
            return beverage
        }
        return beverage
    }
    
    //MARK: 잔액을 확인하는 메소드
    func showCurrentInputAmount() -> Int {
        return money.showCurrentAmount()
    }
    
    //MARK: 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showCurrentStock() -> [Beverage: Int] {
        return beverages.checkBeverageStock()
    }
    
    //MARK: 유통기한 만료된 상품을 체크하는 메소드
    func checkExpiredBeverage() -> [Beverage] {
        var expriedBeverageList = [Beverage]()
        beverages.retrieveBeverage(completion: {
            if $0.isExpired(with: Date()){
                expriedBeverageList.append($0)
            }
        })
        return expriedBeverageList
    }
    
    //MARK: 뜨거운 음료를 체크하는 메소드
    func checkHotBeverage() -> [Beverage] {
        var hotBeverageList = [Beverage]()
        beverages.retrieveBeverage(completion: {
            if $0.isHot(){
                hotBeverageList.append($0)
            }
        })
        return hotBeverageList
    }
    
    //MARK: 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showPurchasedList() -> [Beverage] {
        return purchasedList
    }
}
