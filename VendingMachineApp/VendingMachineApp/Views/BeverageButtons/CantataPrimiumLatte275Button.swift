//
//  CantataPrimiumLatte275Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class CantataPrimiumLatte275Button: BeverageButton {
    override func beverage() -> Beverage? {
        return BeverageInstantiator().cantataPrimiumLatte275
    }
}
