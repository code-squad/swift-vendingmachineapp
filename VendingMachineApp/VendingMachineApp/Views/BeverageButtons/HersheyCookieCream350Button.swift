//
//  HersheyCookieCream350Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class HersheyCookieCream350Button: BeverageButton {
    override func beverage() -> Beverage? {
        return HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 350,
            price: 2000
        )
    }
}
