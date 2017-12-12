//
//  Manager.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Manager: EnableMode {
    private var delegate: ManagerModeDelegate
    var countOfDrinks: [Count] {
        return delegate.countOfRemainDrinks()
    }

    init(target: ManagerModeDelegate) {
        delegate = target
    }
    // 재고 추가
    func add(detail: Int) {
        delegate.add(productIndex: detail)
    }

    // 재고 삭제
    @discardableResult func delete(detail: Int) -> Drink? {
        return delegate.delete(productIndex: detail)
    }

}
