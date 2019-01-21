//
//  History.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History: NSObject {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience override init() {
        self.init(purchases: [])
    }

    var count: Int {
        return purchases.count
    }

    private func postNotificationOfPurchase(userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: .didBuyBeverage, object: self, userInfo: userInfo)
    }

    func willAppear() {
        for (index, purchase) in purchases.enumerated() {
            let userInfo: [AnyHashable: Any] = [Notification.InfoKey.nameOfPurchase: purchase.className,
                                                Notification.InfoKey.indexOfPurchase: index]
            postNotificationOfPurchase(userInfo: userInfo)
        }
    }

    func update(purchase beverage: Beverage) {
        purchases.append(beverage)
        let index = purchases.firstIndex(of: beverage) ?? (purchases.count-1)
        let userInfo: [AnyHashable: Any] = [Notification.InfoKey.nameOfPurchase: beverage.className,
                                            Notification.InfoKey.indexOfPurchase: index]
        postNotificationOfPurchase(userInfo: userInfo)
    }

    func update(from updatePoint: Int) -> ArraySlice<Beverage> {
        let beverages = purchases[updatePoint...]
        return beverages
    }

    func isEmpty() -> Bool {
        return purchases.isEmpty
    }

    func showList(with show: (Int, String) -> Void) {
        for (index, purchase) in purchases.enumerated() {
            show(index + 1, purchase.title)
        }
    }

    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }

    /* MARK: NSSecureCoding */
    private struct Default {
        static let purchases = [Beverage]()
    }

    required init?(coder aDecoder: NSCoder) {
        let purchases = aDecoder
            .decodeObject(forKey: Keys.purchases) as? [Beverage] ?? Default.purchases
        self.purchases = purchases
    }

}

extension History: NSSecureCoding {

    private enum Keys {
        static let purchases = "purchases"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(purchases, forKey: Keys.purchases)
    }

}

extension Notification.Name {
    static let didBuyBeverage = Notification.Name("didBuyBeverage")
}

extension Notification {
    struct InfoKey {
        static let nameOfPurchase = "nameOfPurchase"
        static let indexOfPurchase = "indexOfPurchase"
    }
}
