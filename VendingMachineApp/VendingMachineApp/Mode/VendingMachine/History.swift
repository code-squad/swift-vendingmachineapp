//
//  History.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Extension 
extension Notification {
    struct NotiKey {
        static let purchaseName = "purchaseName"
        static let purchaseIndex = "purchaseIndex"
    }
}

class History: NSObject{
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience override init() {
        self.init(purchases: [])
    }
    
    // MARK: - private func
    private func NotificationPurchase(userData: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: .purchaseList, object: self, userInfo: userData)
    }
    
    // MARK: - func
    func update(data: Int) -> ArraySlice<Beverage>? {
        guard data < purchases.count else { return nil }
        let beverages = purchases[data...]
        return beverages
    }
    
    func viewAppear() {
        for (index, purchase) in purchases.enumerated() {
            let historyData: [AnyHashable: Any] = [Notification.NotiKey.purchaseName: purchase.className,
                                                   Notification.NotiKey.purchaseIndex: index]
            NotificationPurchase(userData: historyData)
        }
    }

    func add(purchase beverage: Beverage) {
        purchases.append(beverage)

        let historyData: [AnyHashable: Any] = [Notification.NotiKey.purchaseName: beverage.className,Notification.NotiKey.purchaseIndex: purchases.firstIndex(of: beverage) ?? (purchases.count-1)]
        NotificationPurchase(userData: historyData)
    }
    
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }
  
    // MARK: - NSSecureCoding
    enum HistoryCodingKeys : String, CodingKey{
        case purchases
    }

    required init?(coder aDecoder: NSCoder) {
        let purchases = aDecoder
            .decodeObject(forKey: HistoryCodingKeys.purchases.rawValue) as? [Beverage] ?? [Beverage]()
        self.purchases = purchases
    }
    
}

extension History: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchases, forKey: HistoryCodingKeys.purchases.rawValue)
    }
}
