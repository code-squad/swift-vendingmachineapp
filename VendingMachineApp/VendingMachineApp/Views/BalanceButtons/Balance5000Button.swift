//
//  Balance5000Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class Balance5000Button: BalanceButton {
    override var balance: Money? {
        return Money(balance: 5000)
    }
    
    override func invokeAction(sender: BalanceButton) {
        action?(balance)
    }
}
