//
//  PepsiDietCola250Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PepsiDietCola250Button: BeverageButton {
    override func beverage() -> Beverage? {
        return Pepsi(
            package: Pepsis.DietCola.Volume250ml.package,
            kiloCalorie: Pepsis.DietCola
                .Volume250ml.kiloCalorie,
            brand: Pepsis.brand,
            name: Pepsis.DietCola.name,
            volume: Pepsis.DietCola.Volume250ml.volume,
            price: Pepsis.DietCola.Volume250ml.price
        )
    }
}
