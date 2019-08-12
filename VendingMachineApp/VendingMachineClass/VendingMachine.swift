//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Array where Element == Product {
    /// 파라미터로 받은 원소가 해당 배열에 몇개 있는지 카운트하는 메소드
    func countElement(of element: Product) -> Int {
        let countArray = self.filter { (value: Product) -> Bool in return value == element }
        return countArray.count
    }

    /// Product 타입의 배열을 중복제거 하고 싶을 때 사용하는 메소드
    func set() -> [Product] {
        var itemsSet = [Product]()
        for item in self {
            if !itemsSet.contains(item) {
                itemsSet.append(item)
            }
        }
        return itemsSet
    }
}

class VendingMachine {
    private var money: Int = 0
    private var items = [Product]()
    private var purchaseDetails = [String]()
    
    /// 해당 아이템 가격보다 가진 돈이 많은지 확인하는 메소드
    func distinctBuyable(of item: Product) -> Bool {
        return item.getPrice() < money
    }

    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    func pay(of addedMoney: Int) {
        money += addedMoney
    }

    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func stockUp(of item: Product, count: Int) {
        for _ in 0..<count {
            items.append(item)
        }
        items.sort()
    }

    /// 특정 상품 인스턴스를 넘겨서 재고를 제거하는 메소드 만약 제거하려는 숫자가 남은 재고 숫자보다 많으면 바로 재고를 0으로 만듬
    func takeOutStock(of item: Product, count: Int) {
        let itemCount = items.countElement(of: item)
        let totalCount: Int = {
            if count > itemCount {
                return 0
            } else {
                return itemCount - count
            }
        }()
        var subtractedItems = items.filter { (value: Product) in return value != item }
        for _ in 0..<totalCount {
            subtractedItems.append(item)
        }
        items = subtractedItems
        items.sort()
    }

    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func displayItems() -> [Product] {
        var buyableItems = [Product]()
        let itemsSet = items.set()
        for item in itemsSet {
            if distinctBuyable(of: item) {
                buyableItems.append(item)
            }
        }
        return buyableItems
    }

    /// 음료수를 구매하는 메소드
    func purchase(of item: Product) -> String {
        let price = item.getPrice()
        guard distinctBuyable(of: item) else {
            return "돈을 더 넣어주세요"
        }
        money -= price
        for index in 0..<items.count {
            if items[index] == item {
                items.remove(at: index)
                purchaseDetails.append(item.getName())
                break
            }
        }
        return "\(item)를 구매하였습니다. \(price)원이 차감됩니다."
    }

    /// 잔액을 확인하는 메소드
    func checkBalance() -> String {
        return "잔액: \(money)"
    }

    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func isFullStock() -> [Product : Int] {
        var dictionaryTypeItems = [Product: Int]()
        for item in items.set() {
            dictionaryTypeItems[item] = items.countElement(of: item)
        }
        return dictionaryTypeItems
    }

    /// 유통기한이 지난 재고만 리턴하는 메소드
    func isItemsPastExpirationDate() -> [Product] {
        let pastedDateitems = items.filter { $0.expireDate() == true }
        return pastedDateitems
    }

    /// 따뜻한 음료만 리턴하는 메소드
    func isHotBeverage() -> [Product] {
        var hotDrinkitems = [Product]()
        let itemsSet = items.set()
        for item in itemsSet {
            if let coffee: Coffee = item as? Coffee, coffee.isHot() {
                hotDrinkitems.append(item)
            }
        }
        return hotDrinkitems
    }

    /// 가지고 있는 상품을 배열로 출력하는 메소드
    func getItems() -> [Product] {
        return items
    }

    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func isPurchaseDetails() -> [String] {
        return purchaseDetails
    }
    
    func printCount(value: Int) -> String {
        return "\(value) 개"
    }
}
