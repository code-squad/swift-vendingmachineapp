//
//  PepsiDietCola591Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PepsiDietCola591Button: BeverageButton {
    override func beverage() -> Beverage? {
        return Pepsi(
            package: Pepsi.Package.pet,
            kiloCalorie: 120,
            brand: "팹시",
            name: "다이어트 콜라",
            volume: 591,
            price: 2000
        )
    }
}
