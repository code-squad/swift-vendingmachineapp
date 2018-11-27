//
//  swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

import os.log

/// 주문된 음료 창고에 관련된 기능들
protocol OrderedDrinkInventory {
    func addInventory(undefinedDrink:Drink)->StoredDrinkDetail?
    func getTotalDrinkDetail()->InventoryDetail
}

/// 음료배열을 여러개 가지는 음료창고
class DrinkInventory : NSObject, NSCoding {
    /// 슬롯들을 모아놓는 변수 선언
    var drinkSlots : [DrinkSlot<Drink>] = []
    /// init
    override init(){
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.chocoMilk))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.lowSugarChocoMilk))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.coke))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.zeroCalorieCoke))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.hotTopCoffee))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.energyDrink))
    }
    
    /// 디코더
    required init?(coder aDecoder: NSCoder) {
        self.drinkSlots = aDecoder.decodeObject(forKey: "drinkSlots") as! [DrinkSlot<Drink>]
    }
    
    /// 인코더
    func encode(with aCoder: NSCoder) {
        aCoder.encode(drinkSlots, forKey: "drinkSlots")
    }
    
    
    /// 음료객체를 받아서 재고정보로 출력
    func getDrinkDetail(drink: Drink)-> StoredDrinkDetail?{
        let inventoryDetail = StoredDrinkDetail(drink:drink, drinkCount: 1)
        return inventoryDetail
    }
    
    /// 해당타입의 음료를 여러번 추가한다
    func addDrinkSelfDuplicate(orderDetail:OrderDetail)throws->StoredDrinkDetail{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == orderDetail.drinkType {
                // 입력개수 만큼 증가
                let resultDetail = try drinkSlot.duplicate(drinkCount: orderDetail.drinkCount)
                // 증가 후 반복문 종료
                return resultDetail
            }
        }
        // 만약 모든 음료슬롯에 해당 타입이 없다면 잘못된음료 에러 리턴
        throw OutputView.errorMessage.wrongDrink
    }
    
    /// 음료수 객체를 받아서 추가
    func addDrink(undefinedDrink:Drink)throws->StoredDrinkDetail?{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == undefinedDrink.drinkType {
                // 입력개수 만큼 증가
                try drinkSlot.addDrink(drink: undefinedDrink)
                // 증가 후 반복문 종료
                return StoredDrinkDetail(drink:undefinedDrink ,drinkCount: 1)
            }
        }
        // 만약 모든 음료슬롯에 해당 타입이 없다면 잘못된음료 에러 리턴
        throw OutputView.errorMessage.wrongDrink
    }
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail()->InventoryDetail{
        // 결과 출력용 변수
        var result = InventoryDetail()
        // 음료슬롯 전부 반복
        for drinkSlot in drinkSlots {
            // 각 음료슬롯의 정보를 추가
            result.takeDrinkDetail(drinkInventory: drinkSlot.getDrinkDetail())
        }
        // 결과 리턴
        return result
    }
  
    /// 음료 여러개 추출
    func popDrinks(orderDetail:OrderDetail)throws->DrinkSlot<Drink>{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == orderDetail.drinkType {
                // 음료슬롯을 리턴
                return try drinkSlot.popDrinks(drinkCount: orderDetail.drinkCount)
            }
        }
        // 가능한 음료가 없다면
        throw OutputView.errorMessage.wrongDrink
    }
    
    /// 음료 구입 가능 여부 확인 함수 
    func calculatePrice(orderCount:Int,balance:Int,drinkType:DrinkType)throws->Int{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == drinkType {
                // 구입가능여부확인 함수를 리턴
                return try drinkSlot.calculatePrice(orderCount: orderCount, balance: balance)
            }
        }
        // 맞는 타입이 없으면
        throw OutputView.errorMessage.wrongDrink
    }
    
    /// 음료슬롯에 음료슬롯을 더하는 함수
    func addDrinks(drinks:DrinkSlot<Drink>)throws->StoredDrinkDetail{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == drinks.drinkType {
                // 구입가능여부확인 함수를 리턴
                return try drinkSlot.addDrinkSlot(drinkSlot: drinks)
            }
        }
        // 맞는 타입이 없으면
        throw OutputView.errorMessage.wrongDrink
    }
}




















