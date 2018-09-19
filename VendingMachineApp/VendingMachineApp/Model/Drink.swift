//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 날자 입출력 포맷. 전역변수로 선언
fileprivate let dateFormat = "yyyyMMdd"

extension Date {
    func toString ()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}

extension String{
    func toDate()->Date?{
         let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
}

/// 모든 음료수의 수퍼클래스
class Drink : CustomStringConvertible {
    fileprivate let brand : String
    fileprivate let size : Int
    fileprivate let price : Int
    fileprivate let name : String
    fileprivate let manufacturingDate : Date
    let drinkType : DrinkType
    
    // 직접 생성시 생성자. 날자를 문자열로 입력받기 때문에 잘못된형태를 위해 옵셔널 선언
    init?(brand:String, size:Int,price:Int, name:String, manufacturingDateString:String,drinkType:DrinkType) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.drinkType = drinkType
        guard let newDate = manufacturingDateString.toDate() else {
            return nil
        }
        self.manufacturingDate = newDate
    }
    
    // 복제를 위한 생성자. 생성일자를 Date 로 직접받기 때문에 옵셔널 아님
    init(brand:String, size:Int,price:Int, name:String, manufacturingDate:Date,drinkType:DrinkType) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.drinkType = drinkType
        self.manufacturingDate = manufacturingDate
    }
    /// 자기복제 함수
    func duplicateSelf()->Drink{
        return Drink(brand: self.brand, size: self.size, price: self.price, name: self.name
            , manufacturingDate: self.manufacturingDate, drinkType: self.drinkType)
    }
    /// toString 의 역할
    var description : String  {
        // 생성자에서 dateFormat 옵셔널 검사가 완료 됬으므로 여기선 강제 래핑
        return ("\(String(describing: type(of: self))) - \(brand), \(size)ml, \(price)원, \(brand), \(manufacturingDate.toString())")
    }
    
    /// 음료값*주문수량 <= 잔액 인지 체크해주는 함수
    func calculatePrice(orderCount:Int,balance:Int)throws->Int{
        if self.price * orderCount <= balance {
            return self.price * orderCount
        }
        else {
            throw OutputView.errorMessage.notEnoughMoney
        }
    }
}

/// 우유 클래스
class Milk : Drink {
    fileprivate let lowFat : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, lowFat: Bool,drinkType:DrinkType) {
        self.lowFat = lowFat
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString,drinkType:drinkType)
    }
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, lowFat: Bool,drinkType:DrinkType) {
        self.lowFat = lowFat
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    
    override func duplicateSelf() -> Milk {
        return Milk(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, lowFat: self.lowFat, drinkType: super.drinkType)
    }
}

class ChocoMilk : Milk {
    fileprivate let lowSugar : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, lowFat: Bool, lowSugar:Bool) {
        self.lowSugar = lowSugar
        let drinkType : DrinkType = lowSugar ? .lowSugarChocoMilk : .chocoMilk
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString, lowFat: lowFat,drinkType:drinkType)
    }
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, lowFat: Bool, lowSugar:Bool) {
        self.lowSugar = lowSugar
        let drinkType : DrinkType = lowSugar ? .lowSugarChocoMilk : .chocoMilk
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate, lowFat: lowFat,drinkType:drinkType)
    }
    
    override func duplicateSelf() -> ChocoMilk {
        return ChocoMilk(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, lowFat: super.lowFat, lowSugar: self.lowSugar)
    }
}

/// 탄산음료 클래스
class Soda : Drink {
    fileprivate let usingPET : Bool
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, usingPET: Bool,drinkType:DrinkType) {
        self.usingPET = usingPET
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString,drinkType:drinkType)
    }
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, usingPET: Bool,drinkType:DrinkType) {
        self.usingPET = usingPET
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    
    override func duplicateSelf() -> Soda {
        return Soda(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, usingPET: self.usingPET, drinkType: super.drinkType)
    }
}


class Coke : Soda {
    fileprivate let zeroCalorie : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, usingPET: Bool,zeroCalorie:Bool) {
        self.zeroCalorie = zeroCalorie
        let drinkType : DrinkType = zeroCalorie ? .zeroCalorieCoke : .coke
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString, usingPET: usingPET,drinkType:drinkType)
    }
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, usingPET: Bool,zeroCalorie:Bool) {
        self.zeroCalorie = zeroCalorie
        let drinkType : DrinkType = zeroCalorie ? .zeroCalorieCoke : .coke
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate, usingPET: usingPET, drinkType:drinkType)
    }
    
    override func duplicateSelf() -> Coke {
        return Coke(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, usingPET: super.usingPET,zeroCalorie:self.zeroCalorie)
    }
}

/// 커피 클래스
class Coffee : Drink{
    fileprivate let hot : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, hot: Bool,drinkType:DrinkType) {
        self.hot = hot
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString,drinkType:drinkType)
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, hot: Bool,drinkType:DrinkType) {
        self.hot = hot
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    
    override func duplicateSelf() -> Coffee {
        return Coffee(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, hot: self.hot, drinkType: super.drinkType)
    }
}


class TopCoffee : Coffee {
    fileprivate let zeroSugar : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String,hot: Bool, zeroSugar: Bool) {
        self.zeroSugar = zeroSugar
        let drinkType : DrinkType  = zeroSugar ? .hotTopCoffee : .none
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString,hot: hot,drinkType:drinkType)
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date,hot: Bool, zeroSugar: Bool) {
        self.zeroSugar = zeroSugar
        let drinkType : DrinkType  = zeroSugar ? .hotTopCoffee : .none
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate,hot: hot,drinkType:drinkType)
    }
    
    override func duplicateSelf() -> TopCoffee {
        return TopCoffee(brand: super.brand, size:super.size, price: super.price, name: super.name, manufacturingDate: super.manufacturingDate, hot: super.hot, zeroSugar: self.zeroSugar)
    }
}

/// 에너지 드링크 클래스
class EnergyDrink : Drink {
    fileprivate let zeroCaffeine : Bool
    
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDateString: String, zeroCaffeine: Bool) {
        self.zeroCaffeine = zeroCaffeine
        let drinkType : DrinkType = zeroCaffeine ? .energyDrink : .none
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDateString: manufacturingDateString, drinkType:drinkType)
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufacturingDate: Date, zeroCaffeine: Bool) {
        self.zeroCaffeine = zeroCaffeine
        let drinkType : DrinkType = zeroCaffeine ? .energyDrink : .none
        super.init(brand: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate, drinkType:drinkType)
    }
    
    override func duplicateSelf()->EnergyDrink{
        return EnergyDrink(brand: self.brand, size: self.size, price: self.price, name: self.name, manufacturingDate: self.manufacturingDate, zeroCaffeine:self.zeroCaffeine)
    }
}


/// 재고정보를 담당할 구조체. 음료의 정보를 받아서 이름,가격,개수,음료타입
struct StoredDrinkDetail {
    let drinkName : String
    let drinkPrice : Int
    var drinkCount : Int
    let drinkType : DrinkType
    
    init(drink:Drink,drinkCount: Int){
        self.drinkName = drink.name
        self.drinkPrice = drink.price
        self.drinkCount = drinkCount
        self.drinkType = drink.drinkType
    }
    
    func isEnoughDrink(orderCount:Int)->Bool{
        return self.drinkCount >= orderCount
    }
}

/// 재고정보를 배열로 가짐
struct InventoryDetail {
    var storedDrinksDetail : [StoredDrinkDetail] = []
    init(){}
    init(drinkDetails:[StoredDrinkDetail]){
        self.storedDrinksDetail = drinkDetails
    }
    
    /// 재고 출력 메세지
    func getAllDrinkDetails()->String{
        // 결과출력을 위한 변수
        var result = ""
        // 번호를 위한 변수
        var number = 1
        result += ("---현재 구매가능한 음료수---\n")
        for drink in storedDrinksDetail {
            result += ("\(number). \(drink.drinkName)-\(drink.drinkPrice)원-\(drink.drinkCount)개\n")
            number += 1
        }
        result += ("----------------------")
        return result
    }
    
    mutating func takeDrinkDetail(drinkInventory:StoredDrinkDetail?){
        if let drinkDetail = drinkInventory {
            self.storedDrinksDetail.append(drinkDetail)
        }
    }
    
    func selectDrinkDetail(drinkNumber:Int)throws->StoredDrinkDetail{
        if drinkNumber > storedDrinksDetail.count {
            throw OutputView.errorMessage.wrongMenu
        }
        return storedDrinksDetail[drinkNumber-1]
    }
}

/// 음료주문에 쓰이는 객체. 음료타입, 개수만 가지고 있다
class OrderDetail{
    let drinkType : DrinkType
    let drinkCount : Int
    init(drinkType : DrinkType,drinkCount : Int){
        self.drinkType = drinkType
        self.drinkCount = drinkCount
    }
}
