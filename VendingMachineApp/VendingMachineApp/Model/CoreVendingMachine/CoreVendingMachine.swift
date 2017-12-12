//
//  CoreVendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 17..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Count = Int
typealias Price = Int

final class CoreVendingMachine {
    private var inventory: [Drink] = [] {
        didSet {
            NotificationCenter.default.post(name: .didChangeInventoryNotification,
                                            object: self)
        }
    }
    private var purchases: [Drink]
    private var inputMoney: Price = 0 {
        didSet {
            NotificationCenter.default.post(name: .didChangeMoneyNotification,
                                            object: self)
        }
    }
    private var income: Price
    private var menu: [Drink]

    init() {
        purchases = [Drink]()
        income = 0
        menu = Menu().drinkList
        setUnarchivedProperties()
    }

}

extension CoreVendingMachine {
    private enum CodingKeys: String {
        case inventory, purchases, inputMoney
    }

    private func makeURLForKey(key: CodingKeys) -> URL {
        let archiveFileName = key.rawValue
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(archiveFileName)
    }

    private func setUnarchivedProperties() {
        inventory = unarchive(key: .inventory) as? [Drink] ?? []
        inputMoney = unarchive(key: .inputMoney) as? Int ?? 0
    }

    func saveChanges() -> Bool {
        return archive(&inventory, key: .inventory)
            && archive(&inputMoney, key: .inputMoney)
    }

    private func unarchive(key: CodingKeys) -> Any? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: makeURLForKey(key: key).path)
    }

    private func archive<T>(_ objects: inout T, key: CodingKeys) -> Bool {
        return NSKeyedArchiver.archiveRootObject(objects,
                                                 toFile: makeURLForKey(key: key).path)
    }

}


extension CoreVendingMachine: ManagerModeDelegate {

    // 음료수 인덱스를 넘겨서 재고를 추가하는 메소드
    func add(productIndex: Int) {
        let drink = menu[productIndex]
        inventory.append(drink)
    }

    // 음료수 인덱스를 넘겨서 재고의 음료수를 삭제하는 메소드
    @discardableResult func delete(productIndex: Int) -> Drink? {
        let drink = menu[productIndex]
        guard let deleteDrinkIndex = inventory.index(of: drink) else {
            return nil
        }
        inventory.remove(at: deleteDrinkIndex)
        return drink
    }

    func howMuchIncome() -> Price {
        return income
    }

    func countOfRemainDrinks() -> [Count] {
        let countOfInventory = listOfInventory()
        var countOfRemainDrinks = [Count]()
        for drink in menu {
            let count = countOfInventory[drink] ?? 0
            countOfRemainDrinks.append(count)
        }
        return countOfRemainDrinks
    }

    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func listOfInventory() -> [Drink: Count ] {
        var countDictionary = [ Drink: Count ]()
        for drink in inventory {
            let count = countDictionary[drink] ?? 0
            countDictionary[drink] = count + 1
        }
        return countDictionary
    }

    // 유통기한이 지난 재고만 리턴하는 메소드
    func listOfOverExpirationDate() -> [Drink] {
        return inventory.filter { $0.valid(with: Date()) }
    }

}

extension CoreVendingMachine: UserModeDelegate {

    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    func add(money: Int) {
        inputMoney += money
    }

    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfCanBuy() -> [Drink] {
        let setInventory = Set(inventory)
        let listOfCanBuy = setInventory.filter { $0.price <= inputMoney }
        return Array(listOfCanBuy)
    }

    @discardableResult func buy(productIndex: Int) -> Drink? {
        let buyDrink = menu[productIndex]
        guard let buyDrinkIndex = inventory.index(of: buyDrink),
            inputMoney >= buyDrink.price else {
            return nil
        }
        inventory.remove(at: buyDrinkIndex)
        inputMoney -= buyDrink.price
        income += buyDrink.price
        purchases.append(buyDrink)
        NotificationCenter.default.post(name: .didBuyDrinkNotifiacation,
                                        object: self)
        return buyDrink
    }

    // 잔액을 확인하는 메소드
    func howMuchRemainMoney() -> Price {
        return inputMoney
    }

    // 따뜻한 음료만 리턴하는 메소드
    func listOfHotDrink() -> [Drink] {
        return inventory.filter { drink in
            guard let coffee = drink as? Coffee else {
                return false
            }
            return coffee.isHot
        }
    }

    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func listOfPurchase() -> [Drink] {
        return purchases
    }

    func extractAllMoney() -> Int {
        let change = inputMoney
        inputMoney = 0
        return change
    }

}

extension Notification.Name {
    static let didChangeInventoryNotification = Notification.Name(rawValue: "DidChangeInventory")
    static let didBuyDrinkNotifiacation = Notification.Name(rawValue: "DidBuyDrink")
    static let didChangeMoneyNotification = Notification.Name("DidChangeMoney")
}
