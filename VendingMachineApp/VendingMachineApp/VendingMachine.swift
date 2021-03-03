//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

<<<<<<< HEAD
struct VendingMachine {
    
    private var drinks : [Drink]
=======
class VendingMachine {
    
    private var drinks: [Drink]
>>>>>>> b528f772da80ea2bcbf1b4f1e3af963c7b0c09e8
    
    init(drinks: [Drink]) {
        self.drinks = drinks
    }
    
<<<<<<< HEAD
    //MARK: 출력
=======
>>>>>>> b528f772da80ea2bcbf1b4f1e3af963c7b0c09e8
    func showVendingMachine(handler: (Drink) -> ()) {
        drinks.forEach {
            handler($0)
        }
    }
<<<<<<< HEAD
    
    //MARK: 현재 금액으로 구매가능한 음료수 목록 메소드
    func showPurchasableDrinks(with nowMoney: Int) -> [Drink]{
        return drinks.filter({$0.isPurchasableDrink(money: nowMoney)})
    }
    
    //MARK: 음료수 구매
    mutating func purcahseDrink(with nowMoney: Int, drink: Drink){
        var canBuyDrink = drinks.filter({$0.isPurchasableDrink(money: nowMoney)})
        if let firstIndex = canBuyDrink.firstIndex(of: drink){
            canBuyDrink.remove(at: firstIndex)
            drinks.remove(at: firstIndex)
            //drinksHistory.append(drink)
        }
    }
=======
>>>>>>> b528f772da80ea2bcbf1b4f1e3af963c7b0c09e8
}
