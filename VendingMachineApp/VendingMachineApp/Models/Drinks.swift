//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/25.
//

import Foundation

class Drinks {
    
    private var drinks: [Drink]
    private var inventory: DrinksInventory
    
    init(_ drinks: [Drink]) {
        self.drinks = drinks
        self.inventory = DrinksInventory()
        classify(with: drinks)
    }
    
    convenience init() {
        self.init([])
    }
    
    func show(handler: (Drink) -> Void) {
        drinks.forEach {
            handler($0)
        }
    }
    
    //음료를 하나하나 출력하는 show 메소드가 불필요해지면 show로 바꿀 예정
    func showStock() -> Dictionary<String, Int>{
        return inventory.drinksInventory
    }
    
    func countType() -> Int {
        return inventory.count()
    }
    //show 메소드와 유사
    func getList() ->  [String]{
        var list = [String]()
        drinks.forEach {
            list.append($0.description)
        }
        return list
    }
    
    func append(_ drink: Drink) {
        drinks.append(drink)
        classify(with: drink)
    }
    
    func append(_ newDrinks: [Drink]) {
        newDrinks.forEach {
            drinks.append($0)
        }
        classify(with: drinks)
    }
    
    func possibleDrinks(with credit: Money) -> Drinks {
        return Drinks(drinks.filter {
            $0.canBuy(with: credit)
        })
    }
    
    func validateDrinks(when date: Date) -> Drinks {
        return Drinks(drinks.filter {
            $0.validate(date: date)
        })
    }
    
    func hotDrinks() -> Drinks {
        return Drinks(drinks.filter {
            $0.isHot()
        })
    }
    
    func lowCalorieDrinks() -> Drinks {
        return Drinks(drinks.filter {
            $0.isLowCalore()
        })
    }
    
    private func classify(with drink: Drink) {
        inventory.append(drink)
    }
    
    func classify(with drinks: [Drink]){
        drinks.forEach {
            inventory.append($0)
        }
    }
    
    func hasDrink(with drink: Drink) -> Bool {
        return true
    }
    
    func diconaryUpdate(with drink: Drink) {
        inventory.pop(drink)
    }
    
    func drinkStock(at index: Int) -> Dictionary<String,Int>.Element{
        inventory.element(at: index)
    }
}
