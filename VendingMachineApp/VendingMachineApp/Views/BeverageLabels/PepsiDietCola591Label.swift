//
//  PepsiDietCola591Label.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PepsiDietCola591Label: BeverageLabel {
    override func beverage() -> Beverage? {
        return Pepsi(
            package: Pepsis.DietCola.Volume591ml.package,
            kiloCalorie: Pepsis.DietCola.Volume591ml.kiloCalorie,
            brand: Pepsis.brand,
            name: Pepsis.DietCola.name,
            volume: Pepsis.DietCola.Volume591ml.volume,
            price: Pepsis.DietCola.Volume591ml.price
        )
    }
}
