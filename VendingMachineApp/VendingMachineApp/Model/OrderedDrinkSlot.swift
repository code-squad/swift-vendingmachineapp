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
    
    /// 기본 생성자에 특별한 인자는 필요없음
    override init(){
        super.init()
    }
    
    /// 디코더
    required init?(coder aDecoder: NSCoder) {
        self.orderedDrinks = aDecoder.decodeObject(forKey: "orderedDrinks") as! [Drink]
    }
    
    /// 인코더
    func encode(with aCoder: NSCoder) {
        aCoder.encode(orderedDrinks, forKey: "orderedDrinks")
    }
    
    /// 음료 1개 추가
    func addOrderedDrink(drink: Drink){
        orderedDrinks.append(drink)
    }
    
    /// 음료 슬롯으로 추가
    func addOrderedDrink(drinkSlot:DrinkSlot<Drink>){
        // 음료 슬롯을 받아서 배열화 한다
        let allDrink = drinkSlot.popAllDrink()
        // 받은 음료들을 주문목록에 추가한다
        for drink in allDrink {
            addOrderedDrink(drink: drink)
        }
    }
    
    /// 추가된 음료 전체 태그값 리턴
    func AllOderedDrinksTag()->[Int]{
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
