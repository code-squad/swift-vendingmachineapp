//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var coins : Int = 0
    private var products = Dictionary<Beverage,Int>()
    private var soldProducts = [Beverage]()

    init(coins : Int = 0){
        self.coins = coins
    }
//  자판기 금액을 원하는 금액만큼 올리는 메소드
    public func charge(coins : Int){
        self.coins += coins
    }
//  특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    public func append(drink : Beverage){
        if products[drink] == nil{
            products[drink] = 0
        }
        let value = products[drink]
        products.updateValue(value! + 1, forKey: drink)
    }
//  현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    public func availableProducts() -> [Beverage]{
        var list = Array<Beverage>()
        products.forEach{ (product, count) in
            if product.available(with : coins) {
                list.append(product)
            }
        }
        return list
    }
    
//  음료수를 구매하는 메소드
    public func buyProduct(drink : Beverage){
        if products[drink] == nil || products[drink]! < 1{ // 상품이 존재하지 않음
            return
        }
        if drink.price > coins { // 잔액 부족
            return
        }
        products.updateValue(products[drink]!-1, forKey: drink)
        charge(coins: drink.price*(-1))
        soldProducts.append(drink)
        if products[drink]! == 0 {
            products.removeValue(forKey: drink)
        }
    }
    
//  잔액을 확인하는 메소드
    public func getbalance() -> Int{
        return coins
    }
    
//  전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    public func getTotalStock() -> Dictionary<Beverage,Int> {
        return products
    }
    
//  유통기한이 지난 재고만 리턴하는 메소드
    public func expiredProduct () -> [Beverage] {
        var list = [Beverage]()
        products.forEach{ (product, count) in
            if !product.didExpiredate() {
                list.append(product)
            }
        }
        return list
    }
    
//  따뜻한 음료만 리턴하는 메소드
    public func getHotDrink() -> [Beverage] {
        var list = [Beverage]()
        products.forEach{ (product, count) in
            if let coffee = product as? Coffee {
                if coffee.isHot() { list.append(coffee)}
            }
        }
        return list
    }
    
//  시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    public func getSoldProducts() -> [Beverage]{
        return soldProducts
    }
}
