//
//  HersheyCookieCream350Instantiator.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class HersheyCookieCream350Instantiator: BeverageInstantiator {
    override var beverage: Beverage? {
        return HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 350,
            price: 2000
        )
    }
}
