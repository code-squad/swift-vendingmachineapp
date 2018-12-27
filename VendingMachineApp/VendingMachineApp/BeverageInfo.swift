//
//  BeverageInfo.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 22..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct BeverageInfo {
    private let name: String
    private let price: Int
    private let beverageCount: Int

    init(name: String, price: Int, beverageCount: Int) {
        self.name = name
        self.price = price
        self.beverageCount = beverageCount
    }

    func info(read: (String, Int, Int) -> String) -> String {
        return read(self.name, self.price, self.beverageCount)
    }
}
