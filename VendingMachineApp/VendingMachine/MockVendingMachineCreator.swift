//
//  MockVendingMachine.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MockVendingMachineCreator {
    
    static private func createDrinkItemList(drink: Drink, count: Int ) -> DrinkItemList{
        var drinkList = [Drink]()
        let drinkInfo = BeverageInfo.init(drink: drink)
        for _ in 0..<count{
            drinkList.append(drink)
        }
        let firstItemList = DrinkItemList.init(drinkList: drinkList, stockInfo: drinkInfo)
        return firstItemList
    }
    
    static private func makeDrinkListByType() -> [Drink]{
        let minimumCaloryElements = CaloryElements(carbon: 0, protein: 0, fat: 0)
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let sugarCaloryElements = CaloryElements(carbon: 30, protein: 0, fat: 5)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        var drinkList = [Drink]()
        let firstDrink = StrawberryMilk.init(brand: "매일우유", quantity: 500, price: 1000, name: "딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        let secondDrink = Coke.init(brand: "펩시", quantity: 500, price: 1500, name: "펩시콜라", date: validDate, sugar: 30, calorySet: sugarCaloryElements, temperature: 5)
        let thirdDrink = BananaMilk.init(brand: "서울우유", quantity: 350, price: 1300, name: "바나나우유", date: validDate, isLowFat: false, bananaPercent: 3, fruitOrigin: "필리핀", milkFarmCode: .kangwon, calorySet: defaultCaloryElements, temperature: 5)
        let fourthDrink = TOPCoffee.init(brand: "맥심", quantity: 450, price: 3000, name: "TOP커피", date: validDate, coffeine: 90, bean: .ethiopia, type: .americano, calorySet: minimumCaloryElements, temperature: 60)
        let fifthDrink = HotSix.init(brand: "롯데칠성", quantity: 250, price: 800, name: "핫식스", date: validDate, sugar: 35, coffeine: 100, taurine: 100, calorySet: sugarCaloryElements, temp: 5)
        drinkList.append(firstDrink)
        drinkList.append(secondDrink)
        drinkList.append(thirdDrink)
        drinkList.append(fourthDrink)
        drinkList.append(fifthDrink)

        return drinkList
    }
    
    static func populateDrinkStockTable() -> DrinkStockTable{
        let drinkTable = DrinkStockTable.init([Int : DrinkItemList]())
        var drinkList = makeDrinkListByType()
        for index in 0..<drinkList.count {
            let itemList = createDrinkItemList(drink: drinkList[index], count: Int.random(in: 1...5))
            drinkTable.updateStockTable(itemList, forKey: index+1)
        }
        return drinkTable
    }
}
