//
//  File.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/10.
//

import Foundation

struct DrinkFactory {
    
    private(set) var normalMilk: Drink
    private(set) var strawberryMilk: Drink
    private(set) var chocolateMilk: Drink
    private(set) var colaSoda: Drink
    private(set) var fantaSoda: Drink
    private(set) var spriteSoda: Drink
    private(set) var geogiaCoffee: Drink
    private(set) var cantataCoffee: Drink
    private(set) var topCoffee: Drink
    
    init() {
        normalMilk = Milk(isMilkFlavor: .Banana,
                          farmCode: "001",
                          brand: "서울우유",
                          capacity: 300,
                          price: 800,
                          name: "서울우유",
                          manufacturedAt: Date(),
                          isHot: false)
        
        strawberryMilk = StrawberryMilk(isContainStrawberry: true, isMilkFlavor: MilkFlavor.Strawberry, farmCode: "002", brand: "서울우유", capacity: 500, price: 700, name: "서울딸기우유", manufacturedAt: Date(), isHot: false)
        
        chocolateMilk = ChocolateMilk(isContainChocolate: true, farmCode: "003", brand: "서울우유", capacity: 500, price: 750, name: "서울초코우유", manufacturedAt: Date(), isHot: false)
        
        colaSoda = Cola(packageType: PackageType.can, isSodaType: SodaType.Cola, factoryCode: "004", brand: "코카콜라", capacity: 500, price: 1000, name: "코카콜라", manufacturedAt: Date(), isHot: false)
        
        fantaSoda = Soda(isSodaType: SodaType.Fanta, factoryCode: "005", brand: "환타", capacity: 500, price: 1000, name: "환타", manufacturedAt: Date(), isHot: false)
        
        spriteSoda = Sprite(inPlastic: true, isSodaType: SodaType.Sprite, factoryCode: "006", brand: "스트리트사이다", capacity: 1000, price: 1000, name: "스트리트사이다", manufacturedAt: Date(), isHot: false)
        
        geogiaCoffee = Georgia(isBlacked: true, isDecaffeinated: 10, isHot: true, isCoffeeBrandName: CoffeeBrandName.Georgia, brand: "조지아커피", capacity: 500, price: 2000, name: "조지아아메리카노", manufacturedAt: Date())
        
        cantataCoffee = Cantata(isPremium: true, isDecaffeinated: 30, isHot: true, isCoffeeBrandName: CoffeeBrandName.Cantata, brand: "칸타타커피", capacity: 500, price: 1000, name: "칸타타커피", manufacturedAt: Date())
        
        topCoffee = Top(coffeeType: CoffeeType.Americano, isDecaffeinated: 20, isHot: false, isCoffeeBrandName: CoffeeBrandName.Top, brand: "탑커피", capacity: 1000, price: 3000, name: "top커피", manufacturedAt: Date())
        
    }
}
