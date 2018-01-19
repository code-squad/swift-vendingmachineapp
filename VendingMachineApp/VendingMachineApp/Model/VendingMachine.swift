//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// inventory를 Collection 프로토콜로 캡슐화.
final class VendingMachine: Sequence, Machine {
    private static var sharedInstance = VendingMachine()
    class func shared() -> VendingMachine {
        return sharedInstance
    }
    class func restoreStates(_ machine: VendingMachine) {
        sharedInstance = machine
    }
    // Iterator.Element의 타입앨리아스
    typealias Element = Beverage
    typealias ProductType = Beverage
    private var stockManager: StockManager<VendingMachine, Beverage>!
    private var moneyManager: MoneyManager<VendingMachine>!
    let start: Int
    private var recentChanged: Beverage
    private var isManagerRemoved: Bool
    private init() {
        self.start = 0
        self.recentChanged = Beverage()
        self.isManagerRemoved = false
        // 장부기록, 돈관리의 책임을 위임.
        self.moneyManager = MoneyManager()
        self.stockManager = StockManager(self)
    }
    // 자판기 내 음료수 인스턴스 저장.
    private var inventory: [Beverage] = [] {
        // 상태변화가 생길 때마다 장부 및 잔액을 업데이트.
        didSet(oldInventory) {
            let removed = isRemoved(oldInventory, inventory)    // 음료수 단순 제거 시
            let purchased = isPurchased(removed)                // 음료수 구입 시
            stockManager.updateStock(recentChanged, isNewArrival: !removed)
            stockManager.recordPurchasedHistory(recentChanged, isPurchased: purchased)
            moneyManager.updateBalance(recentChanged, isPurchased: purchased)
            isManagerRemoved = false
        }
    }

    private func isPurchased(_ isRemoved: Bool) -> Bool {
        return (isRemoved && !isManagerRemoved)
    }

    // 구입된 경우 true 반환.
    private func isRemoved(_ oldStock: [Beverage], _ currStock: [Beverage]) -> Bool {
        return oldStock.count > currStock.count
    }

    func makeIterator() -> ClassIteratorOf<Beverage> {
        return ClassIteratorOf(inventory)
    }

    var count: Int {
        return inventory.count
    }
    var last: Beverage? {
        return inventory.last
    }
}

extension VendingMachine {
    typealias MenuType = Menu
    // 선택 가능한 메뉴. 순서대로 번호 부여.
    enum Menu: Int, EnumCollection, Purchasable, Codable {
        case strawberryMilk = 1
        case bananaMilk
        case chocoMilk
        case coke
        case cider
        case fanta
        case top
        case cantata
        case georgia

        // 각 메뉴의 가격은 노출 가능.
        var price: Int {
            return generate().price
        }

        var productName: String {
            return generate().productName
        }

        // 각 메뉴별 Beverage 인스턴스 생성.
        fileprivate func generate() -> Beverage {
            var beverage = Beverage()
            switch self {
            case .strawberryMilk: beverage = StrawBerryMilk(self)
            case .bananaMilk: beverage = BananaMilk(self)
            case .chocoMilk: beverage = ChocoMilk(self)
            case .coke: beverage = CokeSoftDrink(self)
            case .cider: beverage = CiderSoftDrink(self)
            case .fanta: beverage = FantaSoftDrink(self)
            case .top: beverage = TopCoffee(self)
            case .cantata: beverage = CantataCoffee(self)
            case .georgia: beverage = GeorgiaCoffee(self)
            }
            return beverage
        }

    }
}

extension VendingMachine: Managable {
    // 모든 메뉴의 재고를 count개씩 자판기에 공급.
    func fullSupply(_ count: Int) {
        for menu in MenuType.allValues {
            supply(menu, count)
        }
    }

    // 특정상품의 재고를 N개 공급.
    func supply(_ menu: MenuType, _ count: Stock) {
        for _ in 0..<count {
            // 인벤토리에 추가.
            self.recentChanged = menu.generate()
            inventory.append(recentChanged)
        }
    }

    // 특정상품의 재고를 N개 제거.
    func remove(_ menu: MenuType, _ count: Stock) {
        for _ in 0..<count {
            isManagerRemoved = true
            _ = self.pop(menu)
        }
    }

    // 시작이후 구매 상품 이력 반환.
    func showPurchasedList() -> [HistoryInfo] {
        return stockManager.showPurchasedHistory()
    }
}

extension VendingMachine: UserServable {
    // 주화 삽입.
    func insertMoney(_ money: MoneyManager<VendingMachine>.Unit) {
        moneyManager.insert(money: money)
    }

    // 구매가능한 음료 중 선택한 음료수를 반환.
    func popProduct(_ menu: MenuType) -> ProductType? {
        // 품절이 아닌 상품 중, 현재 금액으로 살 수 있는 메뉴 리스트를 받아옴.
        let affordableList = moneyManager.showAffordableList(from: stockManager.showSellingList())
        // 리스트에 선택한 상품이 있는 경우, 해당 음료수 반환. 없는 경우, nil 반환. (아무일도 일어나지 않음)
        guard affordableList.contains(menu) else { return nil }
        return pop(menu)
    }

    // 자판기 인벤토리에서 특정 메뉴의 음료수를 반환.
    private func pop(_ menu: MenuType) -> Beverage? {
        for (position, beverage) in inventory.enumerated() where menu == beverage.menuType {
            self.recentChanged = beverage
            return inventory.remove(at: position)
        }
        return nil
    }

    // 잔액을 확인.
    func showBalance() -> Balance {
        return moneyManager.balance
    }

    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 반환.
    func checkTheStock() -> [MenuType:Stock] {
        return stockManager.showStockList()
    }

    func showAffordableProducts() -> [MenuType] {
        return moneyManager.showAffordableList(from: stockManager.showSellingList())
    }

    // 유통기한이 지난 재고 리스트 반환.
    func showExpiredProducts(on day: Date) -> [MenuType:Stock] {
        return stockManager.showExpiredList(on: day)
    }

    // 따뜻한 음료 리스트 리턴.
    func showHotProducts() -> [MenuType] {
        // 커피타입인 경우만 해당.
        return MenuType.allValues.filter {
            guard let coffee = $0.generate() as? Coffee else { return false }
            return coffee.isHot
        }
    }

}

extension VendingMachine: Codable {
    enum CodingKeys: String, CodingKey {
        case inventory
        case recentChanged
        case isManagerRemoved
        case stockManager
        case moneyManager
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(inventory, forKey: .inventory)
        try container.encode(recentChanged, forKey: .recentChanged)
        try container.encode(isManagerRemoved, forKey: .isManagerRemoved)
        try container.encode(stockManager, forKey: .stockManager)
        try container.encode(moneyManager, forKey: .moneyManager)
    }
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.inventory = try values.decode([Beverage].self, forKey: .inventory)
        self.recentChanged = try values.decode(Beverage.self, forKey: .recentChanged)
        self.isManagerRemoved = try values.decode(Bool.self, forKey: .isManagerRemoved)
        self.stockManager = try values.decode(StockManager.self, forKey: .stockManager)
        self.moneyManager = try values.decode(MoneyManager.self, forKey: .moneyManager)
    }
}
