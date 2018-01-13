//
//  StockManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StockManager<MachineType: Machine, ProductType: Product> {
    private var machine: MachineType
    // 자판기 메뉴별 남은 재고 기록.
    private var stock: [ProductType.MenuType:Stock] {
        didSet {
            // 뷰 업데이트. M -> C (직접 호출은 아님)
            NotificationCenter.default.post(
                name: NSNotification.Name(NotificationNames.didUpdateInventory.description),
                object: nil)
        }
    }
    // 구입이력 기록.
    private var purchasedHistory: [HistoryInfo]
    init(_ machine: MachineType) {
        self.machine = machine
        self.stock = [:]
        self.purchasedHistory = []
    }

    // 인벤토리 상태에 따라 장부 업데이트.
    func updateStock(_ recentChanged: ProductType, isNewArrival: Bool) {
        stock = stock.update(forKey: recentChanged.menuType, isNewArrival)
    }

    // 품절 여부 반환.
    func isSoldOut(_ beverageType: ProductType.MenuType) -> Bool {
        guard let stock = stock[beverageType] else { return true }
        return stock < 1
    }

    // 재고 기록 반환.
    func showStockList() -> [ProductType.MenuType:Stock] {
        return stock
    }

    // 품절이 아닌 메뉴 리스트 반환.
    func showSellingList() -> [ProductType.MenuType] {
        let notSoldOutList = stock.filter { !isSoldOut($0.key) }
        return notSoldOutList.flatMap { $0.key }
    }

    // 유통기한이 지난 재고 리스트 반환.
    func showExpiredList(on checkingDay: Date) -> [ProductType.MenuType:Stock] {
        var expiredList: [ProductType.MenuType:Stock] = [:]
        // 현재 자판기 내 음료수 중
        guard let machine = machine as? [ProductType] else { return [:] }
        for product in machine {
            // 유통기한이 현재 날짜 기준으로 지난 경우,
            guard product.isExpired(with: checkingDay) else { continue }
            // 리스트에 해당 음료수의 이름과 개수 기록.
            expiredList = expiredList.update(forKey: product.menuType, true)
        }
        return expiredList
    }

    // 구입 이력 반환.
    func showPurchasedHistory() -> [HistoryInfo] {
        return purchasedHistory
    }

    // 구입 이력 기록.
    func recordPurchasedHistory(_ recentChanged: ProductType, isPurchased: Bool) {
        // 음료수를 빼먹은 경우, 구입 이력 생성 및 기록.
        if isPurchased {
            // 현재 구입된 음료수의 구입이력 생성.
            let purchasedInfo = HistoryInfo(purchasingDate: Date(timeIntervalSinceNow: 0),
                                            purchasedMenu: recentChanged.productName,
                                            count: 1)
            // 기록.
            purchasedHistory.append(purchasedInfo)
        }
    }

}
