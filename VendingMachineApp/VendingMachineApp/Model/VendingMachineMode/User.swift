//
//  User.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct User: EnableMode {
    private var delegate: UserModeDelegate
    var remainMoney: Int {
        return delegate.howMuchRemainMoney()
    }
    var purchases: [Drink] {
        return delegate.listOfPurchase()
    }

    init(target: UserModeDelegate) {
        delegate = target
    }

    // 돈 추가
    func add(detail: Int) {
        delegate.add(money: detail)
    }

    // 음료수 삭제 (음료수 구매) 
    @discardableResult func delete(detail: Int) -> Drink? {
        return delegate.buy(productIndex: detail)
    }

}
