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
            package: Pepsi.Package.can,
            kiloCalorie: 80,
            brand: "팹시",
            name: "다이어트 콜라",
            volume: 250,
            price: 1200
        )
    }
}
