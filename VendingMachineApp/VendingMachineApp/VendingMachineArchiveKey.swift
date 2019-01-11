//
//  VendingMachineArchiveKey.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 10..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct VendingMachineArchiveKey {
    static let balance: String = "balanceObject"
    static let products: String = "productsObject"
    static let historyOfPurchase: String = "historyOfPurchaseObject"
}

struct BalanceArchiveKey {
    static let balance: String = "balance"
}

struct ProductsArchiveKey {
    static let products: String = "products"
}

struct HistoryOfPurchaseArchiveKey {
    static let historyOfPurchase: String = "historyOfPurchase"
}
