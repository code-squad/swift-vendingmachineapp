//
//  BeverageFactory.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/03/01.
//

import Foundation

class BeverageFactory {
    enum PackDate {
        case old
        case fresh
    }
    
    enum Price {
        case high
        case low
    }
    
    enum Location {
        case domestic
        case overseas
    }
    
    enum FoodColoringCheck {
        case foodColoring
        case noFoodColoring
    }
    
    enum CaffeineCapacity {
        case high
        case low
    }
    
    //MARK:- RANDOM PROPERTY GENERATORS
    static func generateRandomPrice(with price: Price) -> Int {
        if price == .high {
            return Int.random(in: 5000...30000)
        } else {
            return Int.random(in: 500...4999)
        }
    }
    
    static func generateRandomPackDate(with packDate: PackDate) -> Date {
        let oneDayInSeconds: Double = 86400
        let expiringDateFromPackDate: Double = 60
        
        if packDate == .fresh {
            return Date().addingTimeInterval(-(oneDayInSeconds * Double.random(in: 0...expiringDateFromPackDate - 1)))
        } else {
            return Date().addingTimeInterval(-(oneDayInSeconds * Double.random(in: expiringDateFromPackDate...999)))
        }
    }
    
    static func generateRandomSize() -> Milli_Liter {
        return Milli_Liter(Int.random(in: 1...20) * 100)
    }
    
    static func generateRandomLocation(is location: Location) -> LocationTrackable {
        let domesticLocations = ["경기도", "경상도", "전라도", "강원도", "충청도"]
        let overseasLocations = ["네덜란드", "독일", "호주", "미국"]
        
        if location == .domestic {
            return DomesticLocation(province: domesticLocations.randomElement()!)
        } else {
            return OverseasLocation(country: overseasLocations.randomElement()!)
        }
    }
    
    static func generateFoodColoring(contains: FoodColoringCheck) -> FoodColoring? {
        let randomChemicalConcentrationValue = Int.random(in: 1...300)
        
        if contains == .foodColoring {
            return FoodColoring(color: "random", chemicalConcentration: randomChemicalConcentrationValue)
        } else {
            return nil
        }
    }
    
    static func generateRandomCaffeineCapacity(with capacity: CaffeineCapacity) -> Int {
        if capacity == .high {
            return Int.random(in: 100...1000)
        } else {
            return Int.random(in: 1...99)
        }
    }
        
    //MARK:- BEVERAGES MAKING METHODS
    static func makeBeverage(price: Price, packDate: PackDate) -> Beverage {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let beverageBrands = ["종근당", "롯데"]
        let beverageNames = ["쌍화차","박카스"]
        
        return Beverage(brand: beverageBrands.randomElement()!, size: randomSize, price: randomPrice, name: beverageNames.randomElement()!, packDate: randomPackDate)
    }
    
    static func makeMilk(price: Price, packDate: PackDate, location: Location) -> Milk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let milkBrands = ["남양유업", "서울유유"]
        let milkNames = ["맛있는 우유","건강한 우유", "저지방 우유"]
        let randomLocation = generateRandomLocation(is: location)
        
        return Milk(brand: milkBrands.randomElement()!, size: randomSize, price: randomPrice, name: milkNames.randomElement()!, packDate: randomPackDate, farm: randomLocation)
    }
    
    static func makeStrawBerryMilk(price: Price, packDate: PackDate, location: Location, strawBerryFarm: Location, foodColoring: FoodColoringCheck) -> StrawBerryMilk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let milkBrands = ["남양유업", "서울유유"]
        let milkNames = ["딸기맛 우유","딸기에몽"]
        let randomLocation = generateRandomLocation(is: location)
        let randomStrawBerryFarm = generateRandomLocation(is: strawBerryFarm)
        let randomFoodColoring = generateFoodColoring(contains: foodColoring)
        
        return StrawBerryMilk(brand: milkBrands.randomElement()!, size: randomSize, price: randomPrice, name: milkNames.randomElement()!, packDate: randomPackDate, milkFarm: randomLocation, strawBerryFarm: randomStrawBerryFarm, foodColoring: randomFoodColoring)
    }
    
    static func makeBananaMilk(price: Price, packDate: PackDate, location: Location, bananaFarm: Location, foodColoring: FoodColoringCheck) -> BananaMilk {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let milkBrands = ["남양유업", "서울유유"]
        let milkNames = ["바나나맛 우유","바나나에몽"]
        let randomLocation = generateRandomLocation(is: location)
        let randomBananaFarm = generateRandomLocation(is: bananaFarm)
        let randomFoodColoring = generateFoodColoring(contains: foodColoring)
        
        return BananaMilk(brand: milkBrands.randomElement()!, size: randomSize, price: randomPrice, name: milkNames.randomElement()!, packDate: randomPackDate, milkFarm: randomLocation, bananaFarm: randomBananaFarm, foodColoring: randomFoodColoring)
    }
    
    static func makeSoda(price: Price, packDate: PackDate, isZeroCalories: Bool) -> Soda {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let sodaBrands = ["코카콜라", "펩시콜라", "롯데"]
        let sodaNames = ["닥터페퍼","칠성사이다", "트로피카나"]
        
        return Soda(brand: sodaBrands.randomElement()!, size: randomSize, price: randomPrice, name: sodaNames.randomElement()!, packDate: randomPackDate, zeroCalories: isZeroCalories)
    }
    
    static func makeCola(price: Price, packDate: PackDate, isZeroCalories: Bool) -> Cola {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let colaBrands = ["코카콜라", "펩시콜라"]
        let colaNames = ["콜라","맛있는 콜라"]
        
        return Cola(brand: colaBrands.randomElement()!, size: randomSize, price: randomPrice, name: colaNames.randomElement()!, packDate: randomPackDate)
    }
    
    static func makeFanta(price: Price, packDate: PackDate, isZeroCalories: Bool, foodColoring: FoodColoringCheck, caffeine: CaffeineCapacity) -> Fanta {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let fantaBrands = ["코카콜라", "펩시콜라"]
        let fantaNames = ["판타 오렌지","판타 트로피컬 후르츠"]
        let randomFoodColoring = generateFoodColoring(contains: foodColoring)
        let randomCaffeineCapacity = generateRandomCaffeineCapacity(with: caffeine)
        
        return Fanta(brand: fantaBrands.randomElement()!, size: randomSize, price: randomPrice, name: fantaNames.randomElement()!, packDate: randomPackDate, zeroCalories: false, foodColoring: randomFoodColoring, caffeine: randomCaffeineCapacity)
    }
    
    static func makeCoffee(price: Price, packDate: PackDate) -> Coffee {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let coffeeBrands = ["스타벅스", "커피빈", "할리스커피"]
        let coffeeNames = ["모카치노","얼그레이티", ""]
        
        return Coffee(brand: coffeeBrands.randomElement()!, size: randomSize, price: randomPrice, name: coffeeNames.randomElement()!, packDate: randomPackDate)
    }
    
    static func makeAmericano(price: Price, packDate: PackDate, caffeine: CaffeineCapacity, inHeatingCabinet: Bool) -> Americano {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let americanoBrands = ["스타벅스", "커피빈", "할리스커피"]
        let americanoNames = ["콜드브루","더치블랙", "이탈리아노"]
        let randomCaffeineCapacity = generateRandomCaffeineCapacity(with: caffeine)
    
        return Americano(brand: americanoBrands.randomElement()!, size: randomSize, price: randomPrice, name: americanoNames.randomElement()!, packDate: randomPackDate, bean: .arabica, caffeine: randomCaffeineCapacity, inHeatingCabinet: inHeatingCabinet)
    }
    
    static func makeCaffeLatte(price: Price, packDate: PackDate, caffeine: CaffeineCapacity, inHeatingCabinet: Bool) -> CaffeLatte {
        let randomPrice = generateRandomPrice(with: price)
        let randomPackDate = generateRandomPackDate(with: packDate)
        let randomSize = generateRandomSize()
        let latteBrands = ["스타벅스", "커피빈", "할리스커피"]
        let latteNames = ["TOP 카페라떼","카페라떼 하루", "오늘의 카페라떼"]
        let randomCaffeineCapacity = generateRandomCaffeineCapacity(with: caffeine)
        
        return CaffeLatte(brand: latteBrands.randomElement()!, size: randomSize, price: randomPrice, name: latteNames.randomElement()!, packDate: randomPackDate, bean: .robusta, caffeine: randomCaffeineCapacity, inHeatingCabinet: inHeatingCabinet)
    }
}

