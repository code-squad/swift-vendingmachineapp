//
//  Balance1000Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class Balance1000Button: BalanceButton {
    override var balance: Int? {
        return 1000
    }
    
    override func invokeAction(sender: BalanceButton) {
        action?(balance)
    }
}
