//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var money = Money()
    private var stock = Stock()
    private var soldHistory = Stock()
    
    //  자판기 금액을 원하는 금액만큼 올리는 메소드
    public func charge(coins : Int){
        money.add(with: coins)
    }
    //  자판기 금액을 원하는 금액만큼 내리는 메소드
    public func uncharge(coins : Int){
        money.minus(with: coins)
    }
    
    //  특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    public func append(product : Beverage){
        stock.append(item: product)
    }
    
    //  현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    public func availableProducts() -> [Beverage]{
        return stock.getAvailableProducts(with: money)
    }
    
    /*
     public func sellProduct<T>(type item : T){
        if let item = stock.getProduct(type : type(of: item)) {
            stock.remove(item: item)
            soldHistory.append(item: item)
            charge(coins: item.price)
        }
     }
     */
    // 음료수를 판매하는 메소드
    public func sellProduct(product : Beverage) -> Beverage?{
        if stock.remove(item: product) {
            soldHistory.append(item: product)
            uncharge(coins: product.price)
            return product
        }
        return nil
    }
    
    //  잔액을 돌려주는 메소드
    public func returnCoins() -> Int {
        money.resetCoins()
    }
    
    // 잔액을 확인하는 메소드
    public func getCoins() -> Int {
        return money.coins
    }
    
    //  전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    public func getTotalStock() -> Dictionary<ObjectIdentifier,Int> {
        return stock.toDictionary()
    }
    
    //  유통기한이 지난 재고만 리턴하는 메소드
    public func expiredProduct () -> [Beverage] {
        return stock.getExpiredProducts()
    }
    
    //  따뜻한 음료만 리턴하는 메소드
    public func getHotDrink() -> [Beverage] {
        stock.getHotDrink()
    }
    
    //  시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    public func getSoldProducts() -> [Beverage]{
        return soldHistory.products
    }
}
