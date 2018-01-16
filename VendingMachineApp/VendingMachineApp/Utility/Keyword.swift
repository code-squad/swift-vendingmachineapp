//
//  Keyword.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 15..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import Foundation

struct Keyword {
    enum Key {
        case beverageCounts
        case inventory
        case coins
        case purchase
        case image
        case purchaseListCount
        case product
        case productCount

        var value: String {
            switch self {
            case .beverageCounts:
                return "beverageCounts"
            case .inventory:
                return "inventory"
            case .coins:
                return "coins"
            case .purchase:
                return "purchase"
            case .image:
                return "image"
            case .purchaseListCount:
                return "purchaseListCount"
            case .product:
                return "product"
            case .productCount:
                return "productCount"
            }
        }
    }
}
