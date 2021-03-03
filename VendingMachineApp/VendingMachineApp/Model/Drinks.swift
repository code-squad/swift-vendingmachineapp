//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Drinks {
    
    enum errorCase : Error {
        case outOfIndex
    }
    
    private var drinks : [Drink]
    
    init() {
        self.drinks = []
    }
    
    func addDrink(what product : Drink) {
        drinks.append(product)
    }
    
    func doClosure(closure : (([Drink]) -> Void)) {
        closure(drinks)
    }
    
    /// if fail -> return false.
    func remove(at productType : Drink.Type) throws -> Drink {
        guard let removeTarget = drinks.firstIndex(where: {
            $0.isSameType(with: productType)
        })
        else {
            throw errorCase.outOfIndex
        }
        return drinks.remove(at: removeTarget)
    }
    
    func showDrinks() -> Dictionary<String,Int> {
        var returnDic = Dictionary<String,Int>()
        
        drinks.forEach({
            if returnDic[$0.name] == nil {
                returnDic.updateValue(1, forKey: $0.name)
            }
            else {
                returnDic.updateValue(returnDic[$0.name]! + 1, forKey: $0.name)
            }
        })
        
        return returnDic
    }
    
    func showExpired() -> [Drink] {
        var returnDrinkArr = [Drink]()
        
        drinks.forEach({
            if let downCasting = $0 as? Milk {
                if downCasting.isWithInExpiration() == false {
                    returnDrinkArr.append(downCasting)
                }
            }
        })
        
        return returnDrinkArr
    }
    
    func showHotDrinks() -> Set<String> {
        var returnDrinkArr = Set<String>()
            drinks.forEach({
                if let downCasting = $0 as? TOP {
                    if downCasting.isHot() == true {
                        returnDrinkArr.insert(downCasting.name)
                    }
                }
            })
        
        return returnDrinkArr
    }
}
