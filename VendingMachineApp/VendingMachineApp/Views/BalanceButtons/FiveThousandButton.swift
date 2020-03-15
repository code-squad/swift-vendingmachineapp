//
//  FiveThousandButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/16.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class FiveThousandButton: BalanceButton {
    override func invokeAction(sender: BalanceButton) {
        action?(5000)
    }
}
