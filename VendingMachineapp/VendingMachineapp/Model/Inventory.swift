//
//  Inventory.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/25.
//

import Foundation

class Inventory: NSObject, NSCoding {

    private var inventory: [Beverage]
    private var productList: [Beverage]
    
    override init() {
        inventory = []
        productList = []
    }
    
    required init?(coder: NSCoder) {
        self.inventory = coder.decodeObject(forKey: "inventory") as! [Beverage]
        self.productList = coder.decodeObject(forKey: "productList") as! [Beverage]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(inventory, forKey: "inventory")
        coder.encode(productList, forKey: "productList")
    }
    
    func add(beverage: Beverage) {
        inventory.append(beverage)
    }
    
    func subtract(beverage: Beverage) -> Beverage? {
        
        if let index = search(beverage: beverage) {
            return inventory.remove(at: index)
        } else {
            return nil
        }
    }
    
    func search(beverage: Beverage) -> Int? {
        guard let index = inventory.firstIndex(of: beverage) else {
            return nil
        }
        return index
    }
    
    func eachBeverage(handler: (Beverage) -> ()) {
        inventory.forEach({ (beverage) in
            handler(beverage)
        })
    }
    
    func wholeBeverage() -> [Beverage:Int] {
        let list = inventory.map({$0}).reduce(into: [:]) { counts, name in
            counts[name, default: 0] += 1
        }
        return list
    }
    
    func initializeProductList() -> [Beverage] {
        let strawberryMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expiry: Date.stringToDate(date: "20210227"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: StrawberryMilk.self)!
        
        let chocoMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1100,
                                         brand: "날마다초코우유",
                                         manufactured: Date.stringToDate(date: "20201231"),
                                         expiry: Date.stringToDate(date: "20210115"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: ChocoMilk.self)!
        
        let bananaMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1200,
                                         brand: "날마다바나나우유",
                                         manufactured: Date.stringToDate(date: "20210201"),
                                         expiry: Date.stringToDate(date: "20200228"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: BananaMilk.self)!
        
        let coke = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 2000,
                              brand: "다이어트콜라",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 100,
                              temperature: 10,
                              ofType: Coke.self)!
        
        let sprite = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1500,
                              brand: "스프라이트",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 250,
                              temperature: 10,
                              ofType: Sprite.self)!
        
        let fanta = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1700,
                              brand: "환타",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 300,
                              temperature: 10,
                              ofType: Fanta.self)!
        
        let top = BeverageFactory.createBeverage(
                                 manufacturer: "맥심",
                                 volume: 300,
                                 price: 3500,
                                 brand: "TOP아메리카노",
                                 manufactured: Date.stringToDate(date: "20210110"),
                                 expiry: Date.stringToDate(date: "20210330"),
                                 calorie: 350,
                                 temperature: 20,
                                 ofType: Top.self)!
        
        let cantata = BeverageFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 3000,
                                 brand: "칸타타",
                                 manufactured: Date.stringToDate(date: "20171010"),
                                 expiry: Date.stringToDate(date: "20211231"),
                                 calorie: 350,
                                 temperature: 50,
                                 ofType: Cantata.self)!
        
        let georgia = BeverageFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 500,
                                 brand: "조지아",
                                 manufactured: Date.stringToDate(date: "20210203"),
                                 expiry: Date.stringToDate(date: "20210227"),
                                 calorie: 400,
                                 temperature: 10,
                                 ofType: Georgia.self)!
        
        productList.append(top)
        productList.append(cantata)
        productList.append(georgia)
        productList.append(coke)
        productList.append(sprite)
        productList.append(fanta)
        productList.append(strawberryMilk)
        productList.append(bananaMilk)
        productList.append(chocoMilk)

        return productList
    }
}
