//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김지나 on 22/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
    
enum BeverageType: String {
    case strawberry = "딸기우유"
    case chocolate = "초코우유"
    case cola = "코카콜라"
    case sprite = "스프라이트"
    case kanuIce = "카누 아이스 블랜드"
    case TOPLatte = "TOP카페라떼"
    
    var beverage: Beverage {
        switch self {
        case .strawberry :
            return Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유")
        case .chocolate :
            return Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유")
        case .cola :
            return Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라")
        case .sprite :
            return Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트")
        case .kanuIce :
            return Kanu(kindOfKanu: "아이스블랜드", temperature: -3, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드")
        case .TOPLatte :
            return TOP(flavor: "라떼", temperature: 68, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")
        }
    }
//    case strawberry = "1"
//    case chocolate = "2"
//    case cola = "3"
//    case sprite = "4"
//    case kanuIce = "5"
//    case TOPLatte = "6"
}
struct Inventory {
    var list: [Beverage] = []
    
    func generateBeverage(_ type: String) -> Beverage {
        return BeverageType(rawValue: type)!.beverage
    }
    
    mutating func beverageList(_ type: [BeverageType]) -> [Beverage] {
        for i in type {
            self.list.append(generateBeverage(i.rawValue))
        }
        return self.list
    }
}
    
    


