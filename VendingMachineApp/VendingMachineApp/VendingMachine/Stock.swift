//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Stock {
    private var stocks: [String: [Beverage]] = [:]
    // 재고칸 초기화
    init() {
        for category in DrinkCategory.allCases {
            stocks[category.convertToKey()] = []
        }
    }
    
    func add(_ drink: Beverage) {
        guard (stocks["\(type(of: drink))"]?.append(drink)) != nil else { return }
    }
    
    func isExist(_ menu: Int) -> Bool {
        return  menu > 0 && menu <= stocks.count
    }
    
    func isEmptyStock(_ menu: Int) -> Bool {
        return stocks[selectBy(menu)]?.isEmpty ?? true
    }
    
    private func selectBy(_ menu: Int) -> String {
        guard let category = DrinkCategory(rawValue: menu) else { return "" }
        return category.convertToKey()
    }
    
    func getPrice(menu: Int) -> Int {
        guard let price = DrinkCategory(rawValue: menu) else { return 0 }
        return price.getPriceEachCategory()
    }
    
    func pickOneDrink(menu: Int) -> Beverage {
        return stocks[selectBy(menu)]!.remove(at: 0)
    }
    
    func getPurchaseList(with coin: Coin) -> [String] {
        var purchaseList: [String] = []
        for (key, value) in stocks {
            if !value.isEmpty && coin.isEnoughToBuy(of: value[0].price) { purchaseList.append(key) }
        }
        return purchaseList
    }
    
    func searchExpirationList(to todayDate: Date) -> [Beverage] {
        var past: [Beverage] = []
        for (_, value) in stocks {
            for drink in value where drink.menufactureOfDate < todayDate { past.append(drink) }
        }
        return past
    }
    
    func stockCount() -> Int {
        return stocks.count
    }
    
    func eachStockCount(_ menu: Int) -> Int {
        guard let count = stocks[selectBy(menu)]?.count else { return 0 }
        return count
    }
}
