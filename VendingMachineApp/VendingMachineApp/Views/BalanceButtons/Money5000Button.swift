//
//  Balance5000Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class Money5000Button: MoneyButton {
    override var instantiator: MoneyInstantiator? {
        return Money5000Instantiator()
    }
}
