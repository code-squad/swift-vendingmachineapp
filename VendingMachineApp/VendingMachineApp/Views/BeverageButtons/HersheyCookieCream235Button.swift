//
//  HersheyCookieCream235Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class HersheyCookieCream235Button: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        action?(HersheyChocolateDrink(
            cacaoContentRate: HersheyChocolateDrinks.CookieCream.cacaoContentRate,
            brand: HersheyChocolateDrinks.brand,
            name: HersheyChocolateDrinks.CookieCream.name,
            volume: HersheyChocolateDrinks.CookieCream.Volume235ml.volume,
            price: HersheyChocolateDrinks.CookieCream.Volume235ml.price
        ))
    }
}
