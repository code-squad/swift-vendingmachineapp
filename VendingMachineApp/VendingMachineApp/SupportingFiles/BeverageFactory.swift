//
//  BeverageFactory.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/03/01.
//

import Foundation

class BeverageFactory {
    enum PackageTime {
        case old
        case fresh
    }
    
    enum Price {
        case high
        case low
    }
    
    enum TemperatureCase {
        case hot
        case cold
    }
    
    //MARK:- RANDOM PROPERTY GENERATORS
    static private func generateRandomPrice(with price: Price) -> Int {
        if price == .high {
            return Int.random(in: 50...300) * 100
        } else {
            return Int.random(in: 5...49) * 100
        }
    }
    
    static private func generateRandomPackageTime(with packageTime: PackageTime) -> Date {
        let oneDayInSeconds: Double = 86400
        let expiringDateFrompackageTime: Double = 180
        
        if packageTime == .fresh {
            return Date().addingTimeInterval(-(oneDayInSeconds * Double.random(in: 0...expiringDateFrompackageTime - 1)))
        } else {
            return Date().addingTimeInterval(-(oneDayInSeconds * Double.random(in: expiringDateFrompackageTime...999)))
        }
    }
    
    static private func generateRandomSize() -> Int {
        return Int.random(in: 1...20) * 100
    }
    
    static public func generateRandomLocation() -> LocationTrackable {
        let domesticLocations = ["경기도", "경상도", "전라도", "강원도", "충청도"]
        let overseasLocations = ["네덜란드", "독일", "호주", "미국"]
        
        let picker = Int.random(in: 0...1)
        
        if picker == 0 {
            return DomesticLocation(province: domesticLocations.randomElement()!)
        } else {
            return OverseasLocation(country: overseasLocations.randomElement()!)
        }
    }
    
    static public func generateFoodColoring() -> FoodColoring? {
        let randomChemicalConcentrationValue = Int.random(in: 1...300)
        
        let picker = Int.random(in: 0...1)
        
        if picker == 0 {
            return FoodColoring(color: "random", chemicalConcentration: randomChemicalConcentrationValue)
        } else {
            return nil
        }
    }
    
    static public func generateRandomCaffeineCapacity() -> Int {
        return Int.random(in: 1...1000)
    }
    
    static public func generateRandomCalories() -> Int {
        return Int.random(in: 0...200)
    }
    
    static public func generateRandomTemperature() -> Int {
        return Int.random(in: 0...60)
    }
        
    static public func makeBeverageWithType(brand: String, price: Price, name: String, packageTime: PackageTime, beverageType: Beverage.Type) -> Beverage {
        beverageType.init(brand: brand, size: generateRandomSize(), price: generateRandomPrice(with: price), name: name, packageTime: generateRandomPackageTime(with: packageTime))
    }
}
