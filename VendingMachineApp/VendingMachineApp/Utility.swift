//
//  Utility.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct DateUnit {
    static let secondsOfOneday = 86400
}

enum Flavor {
    case strong
    case light
    case none
}

enum BananaMilkColor {
    case white
    case yellow
}

enum FantaTaste {
    case orange
    case pineapple
    case grape
}

enum Material {
    case can
    case plastic
    case glass
}

enum CashUnit: Int {
    case thousand = 1000
    case fiveThousand = 5000
}

enum SeveralUnit: CustomStringConvertible {
    case won
    case count
    
    var description: String {
        switch self {
        case .won: return "원"
        case .count: return "개"
        }
    }
}

enum Brand: CustomStringConvertible {
    case maeil
    case seoulMilk
    case pepsi
    case cocacola
    case maxim
    case lotteChilsung
    
    var description: String {
        switch self {
        case .maeil:            return "매일우유"
        case .seoulMilk:        return "서울우유"
        case .pepsi:            return "펩시"
        case .cocacola:         return "코카콜라"
        case .maxim:            return "맥심"
        case .lotteChilsung:    return "롯데칠성음료"
        }
    }
}

enum Product: Int, CustomStringConvertible, CaseIterable {
    case organicStrawberryMilk
    case seoulChocoMilk
    case bananasAreNaturallyWhite
    case dietCoke
    case chilsungCider
    case orangeFanta
    case topCoffee
    case cantataCoffee
    case georgiaCoffee
    
    var description: String {
        switch self {
        case .organicStrawberryMilk:    return "유기농딸기우유"
        case .seoulChocoMilk:           return "서울우유"
        case .bananasAreNaturallyWhite: return "바나나는원래하얗다"
        case .dietCoke:                 return "다이어트콜라"
        case .chilsungCider:            return "칠성사이다"
        case .orangeFanta:              return "오렌지맛환타"
        case .topCoffee:                return "TOP커피"
        case .cantataCoffee:            return "칸타타커피"
        case .georgiaCoffee:            return "조지아커피"
        }
    }
}

struct AddingBeverage {
    public static func random(target: Int) -> [Beverage] {
        let numberOfBeverageType = Int.random(in: 2...5)
        let beverages = addBeverage(with: target, amount: numberOfBeverageType)
        return beverages
    }
    
    public static func select(target: Int, amount: Int) -> [Beverage] {
        let beverages = addBeverage(with: target, amount: amount)
        return beverages
    }
    
    private static func addBeverage(with target: Int, amount: Int) -> [Beverage] {
        var beverages = [Beverage]()
        for _ in 1...amount {
            let randomDate = Int.random(in: 1...20)
            let secondsOfDate = -convertSeconds(randomDate)
            switch target {
            case 0: beverages.append(StrawberryMilk(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 1: beverages.append(ChocolateMilk(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 2: beverages.append(BananaMilk(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 3: beverages.append(Coke(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 4: beverages.append(Cider(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 5: beverages.append(Fanta(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 6: beverages.append(TOP(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 7: beverages.append(Cantata(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            case 8: beverages.append(Georgia(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            default: beverages.append(StrawberryMilk(dateOfManufacture: Date(timeIntervalSinceNow: secondsOfDate)))
            }
        }
        return beverages
    }
    
    private static func convertSeconds(_ date: Int) -> Double {
        return Double(date * DateUnit.secondsOfOneday)
    }
}
