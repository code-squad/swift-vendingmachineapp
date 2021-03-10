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
            return Int.random(in: 5000...30000)
        } else {
            return Int.random(in: 500...4999)
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
    
    static private func generateRandomSize() -> Milliliter {
        return Milliliter(with: Int.random(in: 1...20) * 100)
    }
    
    static private func generateRandomLocation() -> LocationTrackable {
        let domesticLocations = ["경기도", "경상도", "전라도", "강원도", "충청도"]
        let overseasLocations = ["네덜란드", "독일", "호주", "미국"]
        
        let picker = Int.random(in: 0...1)
        
        if picker == 0 {
            return DomesticLocation(province: domesticLocations.randomElement()!)
        } else {
            return OverseasLocation(country: overseasLocations.randomElement()!)
        }
    }
    
    static private func generateFoodColoring() -> FoodColoring? {
        let randomChemicalConcentrationValue = Int.random(in: 1...300)
        
        let picker = Int.random(in: 0...1)
        
        if picker == 0 {
            return FoodColoring(color: "random", chemicalConcentration: randomChemicalConcentrationValue)
        } else {
            return nil
        }
    }
    
    static private func generateRandomCaffeineCapacity() -> Int {
        return Int.random(in: 1...1000)
    }
    
    static private func generateRandomCalories() -> Int {
        return Int.random(in: 0...200)
    }
    
    static private func generateRandomTemperature() -> Int {
        return Int.random(in: 0...60)
    }
        
    //MARK:- BEVERAGES MAKING METHODS
    static func makeBeverageWithType(brand: String, price: Price, name: String, packageTime: PackageTime, beverageType: Beverage.Type) -> Beverage {
        switch beverageType {
        case is CaffeLatte.Type: return makeCaffeLatte(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Americano.Type: return makeAmericano(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Coffee.Type: return makeCoffee(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Fanta.Type: return makeFanta(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Cola.Type: return makeCola(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Soda.Type: return makeSoda(brand: brand, price: price, name: name, packageTime: packageTime)
        case is BananaMilk.Type: return makeBananaMilk(brand: brand, price: price, name: name, packageTime: packageTime)
        case is StrawBerryMilk.Type: return makeStrawBerryMilk(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Milk.Type: return makeMilk(brand: brand, price: price, name: name, packageTime: packageTime)
        case is Beverage.Type: return makeBeverage(brand: brand, price: price, name: name, packageTime: packageTime)
        }
    }
    
    static private func makeBeverage(brand: String, price: Price, name: String, packageTime: PackageTime) -> Beverage {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        
        return Beverage(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime)
    }
    
    static private func makeMilk(brand: String, price: Price, name: String, packageTime: PackageTime) -> Milk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomLocation = generateRandomLocation()
        
        return Milk(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, farm: randomLocation)
    }
    
    static private func makeStrawBerryMilk(brand: String, price: Price, name: String, packageTime: PackageTime) -> StrawBerryMilk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomLocation = generateRandomLocation()
        let randomStrawBerryFarm = generateRandomLocation()
        let randomFoodColoring = generateFoodColoring()
        
        return StrawBerryMilk(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, milkFarm: randomLocation, strawBerryFarm: randomStrawBerryFarm, foodColoring: randomFoodColoring)
    }
    
    static private func makeBananaMilk(brand: String, price: Price, name: String, packageTime: PackageTime) -> BananaMilk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomLocation = generateRandomLocation()
        let randomBananaFarm = generateRandomLocation()
        let randomFoodColoring = generateFoodColoring()
        
        return BananaMilk(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, milkFarm: randomLocation, bananaFarm: randomBananaFarm, foodColoring: randomFoodColoring)
    }
    
    static private func makeSoda(brand: String, price: Price, name: String, packageTime: PackageTime) -> Soda {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomCalorie = generateRandomCalories()
        
        return Soda(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, calories: randomCalorie)
    }
    
    static private func makeCola(brand: String, price: Price, name: String, packageTime: PackageTime) -> Cola {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomCalorie = generateRandomCalories()
        
        return Cola(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, calories: randomCalorie)
    }
    
    static private func makeFanta(brand: String, price: Price, name: String, packageTime: PackageTime) -> Fanta {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomFoodColoring = generateFoodColoring()
        let randomCalorie = generateRandomCalories()
        let randomCaffeineCapacity = generateRandomCaffeineCapacity()
        
        return Fanta(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, calories: randomCalorie, foodColoring: randomFoodColoring, caffeine: randomCaffeineCapacity)
    }
    
    static private func makeCoffee(brand: String, price: Price, name: String, packageTime: PackageTime) -> Coffee {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        
        return Coffee(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime)
    }
    
    static private func makeAmericano(brand: String, price: Price, name: String, packageTime: PackageTime) -> Americano {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomCaffeineCapacity = generateRandomCaffeineCapacity()
        let randomTemperature = generateRandomTemperature()
    
        return Americano(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, bean: .arabica, caffeine: randomCaffeineCapacity, temperature: randomTemperature)
    }
    
    static private func makeCaffeLatte(brand: String, price: Price, name: String, packageTime: PackageTime) -> CaffeLatte {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackageTime = generateRandomPackageTime(with: packageTime)
        let randomSize = generateRandomSize()
        let randomCaffeineCapacity = generateRandomCaffeineCapacity()
        let randomTemperature = generateRandomTemperature()
        
        return CaffeLatte(brand: brand, size: randomSize, price: randomPrice, name: name, packageTime: randomPackageTime, bean: .robusta, caffeine: randomCaffeineCapacity, temperature: randomTemperature)
    }
}

