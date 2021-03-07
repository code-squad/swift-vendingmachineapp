//
//  StringUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

extension String {
    func toDate() -> Date{
        let dateFormatter = Date.setDateFormat(with: "yyyyMMdd")
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
    func extractUnsignedInteger() -> Int {
        let stringArray = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        for item in stringArray {
            if let number = Int(item) {
                return number
            }
        }
        return 0
    }
    func toBeverageType() -> Beverage.Type? {
        switch self {
        case "cantata" : return Cantata.self
        case "georgia" : return Georgia.self
        case "top" : return Top.self
        case "hot6ixBlue" : return Hot6ix.self
        case "hot6ixRed" : return Hot6ix.self
        case "monsterBlack" : return Monster.self
        case "banana" : return BananaMilk.self
        case "chocolate" : return ChocolateMilk.self
        case "plain" : return Milk.self
        case "stroberry" : return StroberryMilk.self
        case "sprite" : return Sprite.self
        case "coke" : return Coke.self
        default:
            return nil
        }
    }
}
