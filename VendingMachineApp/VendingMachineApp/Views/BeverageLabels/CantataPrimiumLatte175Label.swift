//
//  CantataPrimiumLatte175Label.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class CantataPrimiumLatte175Label: BeverageLabel {
    override func beverage() -> Beverage? {
        return BeverageInstantiator().cantataPrimiumLatte175
    }
}
