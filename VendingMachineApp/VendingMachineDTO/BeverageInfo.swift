//
//  BeverageInfo.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BeverageInfo: Codable {
    private var nameInfo: String!
    private var priceInfo: Int!
    private (set) var quantityInfo: Int!
    private (set) var brandInfo: String!
    private (set) var drinkItemInfo: Drink!

    var name: String {
        guard let name = nameInfo else{
            return ""
        }
        return name
    }
    
    var price: Int{
        guard let price = priceInfo else{
            return 0
        }
        return price
    }
    
    var dummyDrink : Drink {
        return Drink.init(brand: brandInfo, quantity: quantityInfo, price: priceInfo, name: nameInfo)
    }
    
    init(drink: Drink){
        drink.displayDrinkInfo{ (brand, name, price, quantity) in
            nameInfo = name
            priceInfo = price
            quantityInfo = quantity
            brandInfo = brand
        }
        drinkItemInfo = drink
    }
    
    func isSameDrinkGroup(_ drink: Drink ) -> Bool {
        var result = false
        drink.displayDrinkInfo { (brand, name, price, quantity)  in
            result = nameInfo == name ? true : false
            result = priceInfo == price ? true : false
            result = brandInfo == brand ? true : false
            result = quantityInfo == quantity ? true: false
        }
        return result
    }
    
    func isPurchasable(_ money: Int ) -> Bool {
        if money >= priceInfo {
            return true
        }
        return false
    }
}
