//
//  DrinkStock.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/26.
//

import Foundation

class Drinks {
    
    private var drinks: [Drink]
    private var drinksHistory: [Drink]
    
    init() {
        self.drinks = []
        self.drinksHistory = []
    }
    
    //MARK: 현재 음료수 재고 리스트
    func showNowDrinkList() -> [Drink] {
        return drinks
    }
    
    //MARK: 음료수 총 갯수
    func countDrinkStock() -> Int {
        return drinks.count 
    }
    
    //MARK: 음료수 추가
    func addDrink(what newItem: Drink){
        self.drinks.append(newItem)
    }
    
    //MARK: 음료수 제거
    func removeDrink(at drink: Drink){
        guard let index = drinks.firstIndex(of: drink) else { return }
        drinks.remove(at: index)
    }
    
    //MARK: 뜨거운 음료수 갯수
    func showHotDrinkCount() -> Int {
        var hotDrinks:[Drink] = []
        for item in drinks {
            if item.isHotable() == true {
                hotDrinks.append(item)
            }
        }
        return hotDrinks.count
    }
    
    //MARK: 따뜻한 음료만 리턴
    func showHotDrink() -> [Drink] {
        return drinks.filter({$0.isHotable() == true})
    }
    
    //MARK: 유통기한이 지난 재고 리턴
    func showExpiredDrinks(date: Date) -> [Drink] {
        return drinks.filter({$0.isExpireDate(with: date)})
    }
    
    //MARK: 시작이후 구매한 상품 이력
    func addPurchasedList(with drink: Drink) -> [Drink]{
        drinksHistory.append(drink)
        return drinksHistory
    }
    
    //MARK: 현재금액으로 구매가능한 음료재고
    func getPurchasableDrinks(with nowMoney: Int) -> [Drink] {
        return drinks.filter({$0.isPurchasableDrink(money: nowMoney)})
    }
}

