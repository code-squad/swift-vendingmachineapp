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
    private var pieInfo = DrinkPieInfo()
    
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
        pieInfo.addDrinkNameInfo(drink: drink)
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
    func allOrderedDrinksTag()->[Int]{
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
    
    // 파이정보객체 리턴
    func getPieInfo() -> DrinkPieInfo {
        return self.pieInfo
    }
}


protocol PieInfo {
    var pieInfo : DrinkPieInfo { get }
}


/// 구매된 음료수 원그래프를 위한 정보구조체
struct DrinkNameInfo {
    var drinkName : String
    let drinkType : DrinkType
    var drinkCount : Int
    
    init(drink: Drink) {
        self.drinkName = drink.getName()
        self.drinkType = drink.drinkType
        self.drinkCount = 1
    }
}

struct DrinkPieInfo {
    var drinkNameInfos : [DrinkNameInfo] = []
    
    func allDrinkCount() -> Int {
        var allCount = 0
        for info in drinkNameInfos {
            allCount += info.drinkCount
        }
        return allCount
    }
    
    /// 음료를 받아서 정보를 추가
    mutating func addDrinkNameInfo(drink:Drink){
        for x in 0..<drinkNameInfos.count {
            // 기존 음료타입과 추가타입이 같으면
            if drinkNameInfos[x].drinkType == drink.drinkType {
                // 이름을 변경하고 카운트를 올린다
                drinkNameInfos[x].drinkName = drink.getName()
                drinkNameInfos[x].drinkCount += 1
                return ()
            }
        }
        // 같은 타입이 없다면 새로 추가한다
        drinkNameInfos.append(DrinkNameInfo(drink: drink))
    }
}
