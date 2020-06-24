//
//  PepsiDietCola591Instantiator.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class PepsiDietCola591Instantiator: BeverageInstantiator {
    override var beverage: Beverage? {
        return Pepsi(
            package: Pepsi.Package.pet,
            kiloCalorie: 120,
            name: "다이어트 콜라",
            volume: 591,
            price: 2000
        )
    }
}
