//
//  DrinkSlot.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


/// 음료 종류
enum DrinkType : Int, Codable{
    case
    lowSugarChocoMilk = 1
    ,chocoMilk = 2
    ,zeroCalorieCoke = 3
    ,coke = 4
    ,hotTopCoffee = 5
    ,energyDrink = 6
    ,none = 0
    
    static func returnSelf(rawValue : Int)->DrinkType{
        switch rawValue {
        case 1 : return .lowSugarChocoMilk
        case 2 : return .chocoMilk
        case 3 : return .zeroCalorieCoke
        case 4 : return .coke
        case 5 : return .hotTopCoffee
        case 6 : return .energyDrink
        default : return .none
        }
    }
}

/// 음료 한종류를 가지고 있는 객체
class DrinkSlot<T:Drink> : NSObject, NSCoding {
    // 음료배열을 가진다
    private var drinks:[T]=[]
    
    // 어떤 음료의 슬롯인지
    let drinkType : DrinkType
    
    init(drinkType:DrinkType){
        self.drinkType = drinkType
    }
    
    
    /// 디코더
    required init?(coder aDecoder: NSCoder) {
        self.drinks = aDecoder.decodeObject(forKey: "drinks") as! [T]
        self.drinkType = aDecoder.decodeObject(forKey: "drinkType") as! DrinkType
    }
    
    /// 인코더
    func encode(with aCoder: NSCoder) {
        aCoder.encode(drinks, forKey: "drinks")
        aCoder.encode(drinkType, forKey: "drinkType")
    }
    
    
    /// 음료 추가
    func addDrink(drink:T)throws{
        if drink.drinkType == self.drinkType {
            drinks.append(drink)
        }
        else {
           throw OutputView.errorMessage.wrongDrink
        }
    }
    
    /// 재고 출력
    func getDrinkDetail()-> StoredDrinkDetail?{
        // 재고가 있을경우
        if let drink = self.drinks.first {
            let inventoryDetail = StoredDrinkDetail(drink:drink, drinkCount: self.drinks.count)
            return inventoryDetail
        } // 없을경우
        else {
            return nil
        }
    }
    
    /// 음료 배출
    func popDrink()throws->T{
        // 재고 체크
        if drinks.isEmpty {
            throw OutputView.errorMessage.notEnoughDrink
        }
        // 리턴용 슬롯
        return drinks.removeFirst()
    }
    
    /// 음료 배출
    func popDrinks(drinkCount:Int)throws->DrinkSlot<Drink>{
        // 재고 체크
        if drinks.count < drinkCount {
            throw OutputView.errorMessage.notEnoughDrink
        }
        // 리턴용 슬롯
        let restulDrinkSlot = DrinkSlot<Drink>(drinkType: self.drinkType)
        // 입력개수 만큼 기존 음료슬롯에서 음료를 빼서 결과변수에 추가
        for _ in 1...drinkCount {
            try restulDrinkSlot.addDrink(drink: popDrink())
        }
        // 결과 리턴
        return restulDrinkSlot
    }
    
    /// 음료 복제
    func duplicate(drinkCount:Int)throws->StoredDrinkDetail{
        // 재고가 있는지 체크
        guard let firstDrink = self.drinks.first
            // 없을경우
            else {
                throw OutputView.errorMessage.notEnoughDrink
        }
        
        // 입력개수 만큼 증가
        for _ in 1...drinkCount {
            // 복제해서 추가할 음료정보
            let newDrinkInformation = firstDrink.duplicateSelf() as! T
            
            // 음료정보를 음료로 변환하여 추가한다
            drinks.append(newDrinkInformation)
        }
        return StoredDrinkDetail(drink: firstDrink, drinkCount: drinkCount)
    }
    
    /// 음료 구입 가능 금액 여부 확인 함수 
    func calculatePrice(orderCount:Int,balance:Int)throws->Int{
        if self.drinks.isEmpty == false  {
            return try drinks[0].calculatePrice(orderCount: orderCount, balance: balance)
        }
        throw OutputView.errorMessage.notEnoughMoney
    }
    
    /// 음료슬롯을 받아서 전부 추가
    func addDrinkSlot(drinkSlot:DrinkSlot<T>)throws->StoredDrinkDetail{
        // 옮겨진 음료들의 정보를 담는 음료정보 변수
        guard let result = drinkSlot.getDrinkDetail() else {
            // 0개면 에러
            throw OutputView.errorMessage.notEnoughDrink
        }
        // 서로 타입이 다른 음료일 경우 에러
        if self.drinkType != result.drinkType {
            throw OutputView.errorMessage.wrongDrink
        }
        
        // 음료 개수만큼 음료를 추출한다. 이경우는 전부
        for _ in 1...result.drinkCount {
            try self.addDrink(drink: drinkSlot.popDrink())
        }
        // 옴기는 과정이 완료되면 결과정보 리턴
        return result
    }
}












