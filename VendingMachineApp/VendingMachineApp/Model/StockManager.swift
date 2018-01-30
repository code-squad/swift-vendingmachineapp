//
//  StockManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

final class StockManager {
    private var machine: VendingMachine?
    // 자판기 메뉴별 남은 재고 기록.
    private var stock: [VendingMachine.Menu:Stock] {
        didSet {
            // 뷰 업데이트. M -> C (직접 호출은 아님)
            NotificationCenter.default.post(name: .didUpdateStock, object: nil)
        }
    }
    // 구입이력 기록.
    private(set) var purchasedHistory: [HistoryInfo] {
        didSet {
            // 해당 음료의 총 구입개수 업데이트
            guard let lastRecord = purchasedHistory.last else { return }
            purchasedCounts = purchasedCounts.update(amount: 1, forKey: lastRecord.purchasedMenu, true)
            totalPurchasedCount += lastRecord.count
        }
    }
    private(set) var totalPurchasedCount: Int
    private(set) var purchasedCounts: [VendingMachine.Menu:Int]
    init(_ machine: VendingMachine?) {
        self.machine = machine
        self.stock = [:]
        self.purchasedHistory = []
        self.purchasedCounts = [:]
        self.totalPurchasedCount = 0
    }

    // 인벤토리 상태에 따라 장부 업데이트.
    func updateStock(_ recentChanged: Beverage, isNewArrival: Bool) {
        stock = stock.update(amount: 1, forKey: recentChanged.menuType, isNewArrival)
    }

    // 품절 여부 반환.
    func isSoldOut(_ beverageType: VendingMachine.Menu) -> Bool {
        guard let stock = stock[beverageType] else { return true }
        return stock < 1
    }

    // 재고 기록 반환.
    func showStockList() -> [VendingMachine.Menu:Stock] {
        return stock
    }

    // 품절이 아닌 메뉴 리스트 반환.
    func showSellingList() -> [VendingMachine.Menu] {
        let notSoldOutList = stock.filter { !isSoldOut($0.key) }
        return notSoldOutList.flatMap { $0.key }
    }

    // 유통기한이 지난 재고 리스트 반환.
    func showExpiredList(on checkingDay: Date) -> [VendingMachine.Menu:Stock] {
        var expiredList: [VendingMachine.Menu:Stock] = [:]
        // 현재 자판기 내 음료수 중
        guard let machine = machine else { return [:] }
        for product in machine {
            // 유통기한이 현재 날짜 기준으로 지난 경우,
            guard product.isExpired(with: checkingDay) else { continue }
            // 리스트에 해당 음료수의 이름과 개수 기록.
            expiredList = expiredList.update(amount: 1, forKey: product.menuType, true)
        }
        return expiredList
    }

    // 구입 이력 생성.
    func recordPurchasedHistory(_ recentChanged: Beverage, isPurchased: Bool) {
        // 음료수가 구매된 경우에만 기록
        if isPurchased {
            let newInfo = HistoryInfo(
                purchasingDate: Date(timeIntervalSinceNow: 0),
                purchasedMenu: recentChanged.menuType,
                count: 1)
            purchasedHistory.append(newInfo)
        }
    }

}

extension StockManager: Codable {
    enum CodingKeys: String, CodingKey {
        case stock
        case purchasedHistory
        case purchasedCount
        case totalPurchasedCount
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stock, forKey: .stock)
        try container.encode(purchasedHistory, forKey: .purchasedHistory)
        try container.encode(purchasedCounts, forKey: .purchasedCount)
        try container.encode(totalPurchasedCount, forKey: .totalPurchasedCount)
    }
    convenience init(from decoder: Decoder) throws {
        self.init(nil)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.stock = try values.decode([VendingMachine.Menu: Stock].self, forKey: .stock)
        self.purchasedHistory = try values.decode([HistoryInfo].self, forKey: .purchasedHistory)
        self.purchasedCounts = try values.decode([VendingMachine.Menu: Int].self, forKey: .purchasedCount)
        self.totalPurchasedCount = try values.decode(Int.self, forKey: .totalPurchasedCount)
    }
}
