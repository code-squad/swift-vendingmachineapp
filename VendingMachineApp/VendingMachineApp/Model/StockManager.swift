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
            let sum = sumPurchasedCount(of: lastRecord.purchasedMenu)
            totalPurchasedCount.updateValue(sum, forKey: lastRecord.purchasedMenu)
        }
    }
    private(set) var totalPurchasedCount: [VendingMachine.Menu:Int] {
        didSet {
            // 새 음료 종류가 추가된 경우에만 알림.
            if oldValue.count < totalPurchasedCount.count {
                // 가장 최근 구매이력 항목을 이용.
                guard let lastRecord = purchasedHistory.last else { return }
                NotificationCenter.default.post(
                    name: .didUpdateRecord,
                    object: nil,
                    userInfo: [UserInfoKeys.addedRecord: lastRecord])
            }
        }
    }
    init(_ machine: VendingMachine?) {
        self.machine = machine
        self.stock = [:]
        self.purchasedHistory = []
        self.totalPurchasedCount = [:]
    }

    // 인벤토리 상태에 따라 장부 업데이트.
    func updateStock(_ recentChanged: Beverage, isNewArrival: Bool) {
        stock = stock.update(forKey: recentChanged.menuType, isNewArrival)
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
            expiredList = expiredList.update(forKey: product.menuType, true)
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

    // 특정 음료수의 총 판매량
    private func sumPurchasedCount(of menu: VendingMachine.Menu) -> Int {
        return purchasedHistory.reduce(0) {
            if $1.purchasedMenu == menu {
                return $0 + $1.count
            }
            return 0
        }
    }

}

extension StockManager: Codable {
    enum CodingKeys: String, CodingKey {
        case stock
        case purchasedHistory
        case purchasedCount
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stock, forKey: .stock)
        try container.encode(purchasedHistory, forKey: .purchasedHistory)
        try container.encode(totalPurchasedCount, forKey: .purchasedCount)
    }
    convenience init(from decoder: Decoder) throws {
        self.init(nil)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.stock = try values.decode([VendingMachine.Menu: Stock].self, forKey: .stock)
        self.purchasedHistory = try values.decode([HistoryInfo].self, forKey: .purchasedHistory)
        self.totalPurchasedCount = try values.decode([VendingMachine.Menu: Int].self, forKey: .purchasedCount)
    }
}
