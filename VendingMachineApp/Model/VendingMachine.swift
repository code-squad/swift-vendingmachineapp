//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var coins : Int = 0
    private var stocks = Dictionary<Beverage,Int>()
    private var soldProducts = [Beverage]()
    
    private func updateMachineState(buy product : Beverage){
        stocks.updateValue(stocks[product]!-1, forKey: product)
        charge(coins: product.price*(-1))
        soldProducts.append(product)
        if stocks[product]! == 0 {
            stocks.removeValue(forKey: product)
        }
    }
//  자판기 금액을 원하는 금액만큼 올리는 메소드
    public func charge(coins : Int){
        self.coins += coins
    }
//  특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    public func append(product : Beverage){
        if stocks[product] == nil{
            stocks[product] = 0
        }
        let value = stocks[product]
        stocks.updateValue(value! + 1, forKey: product)
    }
//  현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    public func availableProducts() -> [Beverage]{
        var list = Array<Beverage>()
        stocks.forEach{ (product, count) in
            if product.availablePrice(with : coins) {
                list.append(product)
            }
        }
        return list
    }
    
//  음료수를 구매하는 메소드
    public func buyProduct(product : Beverage){
        if stocks[product] == nil || stocks[product]! < 1{ // 상품이 존재하지 않음
            return
        }
        if product.price > coins { // 잔액 부족
            return
        }
        updateMachineState(buy: product)
    }
    
//  잔액을 확인하는 메소드
    public func getbalance() -> Int{
        return coins
    }
    
//  전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    public func getTotalStock() -> Dictionary<Beverage,Int> {
        return stocks
    }
    
//  유통기한이 지난 재고만 리턴하는 메소드
    public func expiredProduct () -> [Beverage] {
        var list = [Beverage]()
        stocks.forEach{ (product, count) in
            if !product.didExpiredate() {
                list.append(product)
            }
        }
        return list
    }
    
//  따뜻한 음료만 리턴하는 메소드
    public func getHotDrink() -> [Beverage] {
        var list = [Beverage]()
        stocks.forEach{ (product, count) in
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
