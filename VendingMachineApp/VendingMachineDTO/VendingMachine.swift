//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine: ProductSoldable, Codable {
    private var balance : Int
    private var earning: Int = 0
    private var shoppingHistory: [Drink]
    
    static let sharedInstance = VendingMachine(MockVendingMachineCreator.populateDrinkStockTable())
    /// 메뉴번호별 음료수 리스트 1~6
    private var drinkStockTable: DrinkStockTable
    /// drinkName과 메뉴번호 매핑한 딕셔너리
    private (set) var menuTable: MenuTable
    
    private init(_ drinkStockTable: DrinkStockTable){
        self.drinkStockTable = drinkStockTable
        balance = 0
        shoppingHistory = [Drink]()
        menuTable = MenuTable.init(drinkStockTable: drinkStockTable)
    }
    
    ///자판기 금액을 원하는 금액만큼 올리는 메소드
    func chargeBalance(_ money: Int){
        balance += money
    }
    
    ///전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showDrinkStockTable() -> DrinkStockTable{
        return drinkStockTable
    }
    
    func showDrinkStockTableMenuSize() -> Int {
        return drinkStockTable.stockTable.count
    }
    
    ///시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showShoppingHistory() -> [Drink] {
        return shoppingHistory
    }
    
    ///유통기한이 지난 재고만 리턴하는 메소드
    func showValidateOverDrink() -> [Drink]{
        let totalNotForSaleList = drinkStockTable.showValidateOverDrink()
        return totalNotForSaleList
        
    }
    ///따뜻한 음료만 리턴하는 메소드
    ///동일한 상품 카테고리 물건이라도 서로 다른 온도를 지닐 수 있음을 가정
    func showHotterDrinkList() -> [Drink]{
        let hotDrinkList = drinkStockTable.showHotterDrinkList()
        return hotDrinkList
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func showBuyableDrinkList() -> [Drink]{
        let buyableDrinkList = drinkStockTable.showBuyableDrinkList(balance)
        return buyableDrinkList
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    ///만약 해당 상품인스턴스가 기존 재고에 없다면 넘버링을 새로하여 메뉴테이블과 재고테이블에 추가한다.
    func addDrinkStock(_ drink: Drink, quantity: Int) throws {
        if let menuNumber = menuTable.menu[drink.name] {
            try addStockDefault(drink: drink, number: menuNumber, quantity: quantity)
        }else{
            let newMenuNumber = menuTable.menu.count+1
            menuTable.updateMenuTable(nextIndex: newMenuNumber, name: drink.name)
            drinkStockTable.updateDrinkStockTable(nextIndex: newMenuNumber, drinkElement: drink)
            try addStockDefault(drink: drink, number: newMenuNumber, quantity: quantity-1)
        }
    }
    
    func selectProduct(productId: Int) throws -> Drink{
        do{
            let productList = try drinkStockTable.selectProduct(productId: productId)
            return productList
        }catch let error as VendingMachineError{
            throw error
        }
    }
    
    func showSpecifiedDrinkStockSize(_ index: Int) throws -> Int{
        do {
            guard let list = drinkStockTable.stockTable[index] else{
                throw VendingMachineError.notFoundDrinkIdError
            }
            return list.drinkStockList.count
        }catch let error as VendingMachineError {
            throw error
        }
    }
    
    func removeDrinkStock(number: Int, quantity: Int) throws -> (Drink, actualRemoved: Int){
        do{
            let removeItemInfo = try drinkStockTable.removeDrinkStock(number: number, quantity: quantity)
            return removeItemInfo
        }catch{
            throw VendingMachineError.notFoundDrinkIdError
        }
    }
    
    private func addStockDefault(drink: Drink, number : Int, quantity: Int) throws {
        let drinkList = drinkStockTable.stockTable[number]!
        try drinkList.addItem(drink, quantity: quantity)
    }

    ///잔액을 확인하는 메소드
    func informCurrentBalance() -> Int {
        return balance
    }
    
    ///음료수를 구매(판매)하는 메소드
    func sellProduct(productId: Int) throws -> Drink {
        guard let productList = drinkStockTable.stockTable[productId] else {
            throw VendingMachineError.notFoundDrinkIdError
        }
        if productList.isAvailable(balance){  /// 판매 가능하면 업데이트
            productList.makeNotForSaleList()
            if productList.isEmpty{
                throw VendingMachineError.outOfStockError
            }
            let soldProduct = productList.removeFirstElement()
            let price = productList.drinkStockInfo.price
            minusProductPriceFromBalance(price)
            updateEarning(price)
            drinkStockTable.updateStockTable(productList, forKey: productId)
            shoppingHistory.append(soldProduct)
            return soldProduct
        }
        throw VendingMachineError.notEnoughMoneyError
    }
    
    private func updateEarning(_ money: Int){
        earning += money
    }
    
    private func minusProductPriceFromBalance(_ money: Int) {
        balance -= money
    }
    
    func showCurrentBalanceInfo(printFormat: (_ balance: Int) -> Void){
        printFormat(balance)
    }
    
    func showCurrentEarningInfo(printFormat: (_ earning: Int) -> Void){
        printFormat(earning)
    }
    
    func displayDrinkMenuList(printFormat: ([(key: Int, value: DrinkItemList)]) -> Void ) {
        let sortedMenutable = drinkStockTable.stockTable.sorted{$0.key < $1.key }
        printFormat(sortedMenutable)
    }
}
