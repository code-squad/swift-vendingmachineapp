//
//  PepsiDietCola591Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PepsiDietCola591Button: BeverageButton {
    override func instantiator() -> BeverageInstantiator? {
        return PepsiDietCola591Instantiator()
    }
}
