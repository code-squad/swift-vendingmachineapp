//
//  DrinkStockTable.swift
//  VendingMachine
//
//  Created by hw on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class DrinkStockTable: Codable {
    private (set) var stockTable: [Int : DrinkItemList]

    init(_ table:[Int: DrinkItemList]){
        stockTable = table
    }
    
    func updateStockTable(_ list: DrinkItemList, forKey index: Int){
        stockTable.updateValue(list, forKey: index)
    }
    
    ///유통기한이 지난 재고만 리턴하는 메소드
    func showValidateOverDrink() -> [Drink]{
        var totalNotForSaleList = [Drink]()
        for offsetElementpair in stockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            let stockNotForSaleList = drinkStockList.makeNotForSaleList()
            totalNotForSaleList += stockNotForSaleList
        }
        return totalNotForSaleList
    }
    
    ///따뜻한 음료만 리턴하는 메소드
    ///동일한 상품 카테고리 물건이라도 서로 다른 온도를 지닐 수 있음을 가정
    func showHotterDrinkList() -> [Drink]{
        var hotDrinkList = [Drink]()
        for offsetElementpair in stockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            hotDrinkList += drinkStockList.getHotDrinkList()
        }
        return hotDrinkList
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func showBuyableDrinkList(_ balance: Int) -> [Drink]{
        var buyableDrinkList = [Drink]()
        for offsetElementpair in stockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            if drinkStockList.isAvailable(balance) {
                buyableDrinkList.append(drinkStockList.drinkStockInfo.drinkItemInfo)
            }
        }
        return buyableDrinkList
    }
    
    func selectProduct(productId: Int) throws -> Drink{
        guard let productList = stockTable[productId] else{
            throw VendingMachineError.notFoundDrinkIdError
        }
        if productList.drinkStockList.isEmpty {
            return productList.drinkStockInfo.drinkItemInfo
        }
        return productList.drinkStockList[0]
    }
    
    func removeDrinkStock(number: Int, quantity: Int) throws -> (Drink, actualRemoved: Int){
        if let itemList = stockTable[number]{
            let removeItemInfo = itemList.removeElement(quantity: quantity)
            return removeItemInfo
        }
        throw VendingMachineError.notFoundDrinkIdError
    }
    
    private func addStockDefault(drink: Drink, number : Int, quantity: Int) throws {
        let drinkList = stockTable[number]!
        try drinkList.addItem(drink, quantity: quantity)
    }
    
    func updateDrinkStockTable (nextIndex newMenuNumber: Int, drinkElement : Drink){
        let drinkItemListInfoSet = makeNewDrinkItemInfo(drinkElement)
        let newDrinkItemList = DrinkItemList(drinkList: drinkItemListInfoSet.drinkList, stockInfo: drinkItemListInfoSet.info)
        updateStockTable(newDrinkItemList, forKey: newMenuNumber)
    }
    
    private func makeNewDrinkItemInfo(_ drink: Drink) -> (drinkList: [Drink], info: BeverageInfo){
        let newBeverageInfo = BeverageInfo.init(drink: drink)
        var stockList = [Drink]()
        stockList.append(drink)
        return (stockList, newBeverageInfo)
    }
}
