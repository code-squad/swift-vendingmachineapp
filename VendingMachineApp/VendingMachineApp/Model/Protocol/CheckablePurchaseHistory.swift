//
//  ChackHistory.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/18.
//  Copyright © 2021 Tailor. All rights reserved.
//

import Foundation

protocol CheckablePurchaseHistory {
    var historyPublisher: Published<[Drink]>.Publisher { get }
    func append(_ drink: Drink)
    func checkedPurchaseHistory(handle: (Drink) -> ())
    func checkedLastPurchaseHistory() -> Drink?
}
