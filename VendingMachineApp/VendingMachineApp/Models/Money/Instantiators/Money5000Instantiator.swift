//
//  Money5000Instantiator.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class Money5000Instantiator: MoneyInstantiator {
    override var money: Money? {
        return Money(balance: 5000)
    }
}
