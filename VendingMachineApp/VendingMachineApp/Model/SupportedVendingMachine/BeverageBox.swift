//
//  BeverageBox.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

final class BeverageBox {
    private(set) var beverageMenu: BeverageMenu
    private(set) var quantity: Int
    
    init() {
        self.beverageMenu = .bananaMilk
        self.quantity = 0
    }
    
    init(beverageMenu: BeverageMenu, quantity: Int) {
        self.beverageMenu = beverageMenu
        self.quantity = quantity
    }
}

extension BeverageBox: Codable {
    private enum CodingKeys: CodingKey {
        case beverageMenu, quantity
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.beverageMenu = try values.decode(BeverageMenu.self, forKey: .beverageMenu)
        self.quantity = try values.decode(Int.self, forKey: .quantity)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(beverageMenu, forKey: .beverageMenu)
        try container.encode(quantity, forKey: .quantity)
    }
}
