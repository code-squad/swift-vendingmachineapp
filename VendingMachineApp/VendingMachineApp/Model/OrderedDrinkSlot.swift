//
//  OrderedDrinkSlot.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 11. 29..
//  Copyright © 2018년 Drake. All rights reserved.
//

import Foundation

class OrderedDrinkSlot : NSObject, NSCoding {
    /// 주문받은 음료를 배열에 포함
    private var orderedDrinks : [Drink] = []
    
    /// 디코더
    required init?(coder aDecoder: NSCoder) {
        self.orderedDrinks = aDecoder.decodeObject(forKey: "orderedDrinks") as! [Drink]
    }
    
    /// 인코더
    func encode(with aCoder: NSCoder) {
        aCoder.encode(orderedDrinks, forKey: "orderedDrinks")
    }
    
    /// 음료 추가
    func addOrderedDrink(drink: Drink){
        orderedDrinks.append(drink)
    }
    
    /// 추가된 음료 전체 태그값 리턴
    func AllOderedDrinksTag()throws->[Int]{
        // 결과 저장용 변수
        var result : [Int] = []
        // 주문된 음료가 없으면 바로 리턴
        if orderedDrinks.count == 0 {
            return result
        }
        for drink in orderedDrinks {
            result.append(drink.drinkType.rawValue)
        }
        // 결과 리턴
        return result
    }
    
}
