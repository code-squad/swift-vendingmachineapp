//
//  StockBeverages.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

class StockDrink: StockFactory {
    private(set) var stock: [Drink]
    
    init() {
        stock = [Drink]()
    }
    
    public func add(_ drink: Drink) {
        stock.append(drink)
    }

    func checkProductization(of drink: Drink) -> Bool {
        return (drink as? Productization) != nil ? true : false
    }

    public func addDrink(_ drink: Drink) {
        if !checkProductization(of: drink) { return }
        add(drink)
    }

    public func availableDrink() -> [Drink] {
        var availableDrinks = Set<Drink>()
        for drink in self.stock {
            availableDrinks.update(with: drink)
        }
        return Array(availableDrinks)
    }

    public func buy(_ drink: Drink, checkCoin: (Drink) -> Drink?) -> Drink? {
        if !checkProductization(of: drink) { return nil }
        return checkCoin(drink)
    }

    public func findExpiredDrinks() -> [Drink] {
        var disuseStock = Array<Drink>()
        for drink in self.stock {
            guard let drinkProduct = drink as? Productization else { continue }
            let now = Date()
            if !drinkProduct.validate(with: now) {
                disuseStock.append(drink)
            }
        }
        return disuseStock
    }

    public func findWarmDrinks() -> [Drink] {
        var warmDrinks = Array<Drink>()
        for drink in stock {
            guard let drinkProduct = drink as? Productization else { continue }
            if drinkProduct.isHot() {
                warmDrinks.append(drink)
            }
        }
        return warmDrinks
    }
    
    
    public func showStock() -> [Drink: UInt] {
        var eachStock = Dictionary<Drink, UInt>()
        for drink in stock {
            eachStock[drink, default: 0] += 1
        }
        return eachStock
    }
}



//자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
//자판기 금액을 원하는 금액만큼 올리는 메소드 o
//특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드 o
//현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
//음료수를 구매하는 메소드
//잔액을 확인하는 메소드
//전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
//유통기한이 지난 재고만 리턴하는 메소드
//따뜻한 음료만 리턴하는 메소드
//시작이후 구매 상품 이력을 배열로 리턴하는 메소드
//각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.
//테스트가 가능하다면 위에 동작 규칙을 다르게 구현해도 된다.
//전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.
//예를 들어서, 재고 몇 개 추가하고 잔액 얼마 추가하면 어떤 상품 구매가능, 불가능인지 확인하고 가능한 상품 구매하고, 잔액 바뀌고 재고 상태 바뀌고, 구매 상품 이력을 확인한다.
