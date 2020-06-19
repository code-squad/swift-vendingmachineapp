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
        return Cantata(
            milkContentRate: Cantatas.PriumLatte.milkContentRate,
            sugarContentRate: Cantatas.PriumLatte.milkContentRate,
            celsius: 65,
            brand: Cantatas.brand,
            name: Cantatas.PriumLatte.name,
            volume: Cantatas.PriumLatte.Volume175ml.volume,
            price: Cantatas.PriumLatte.Volume175ml.price
        )
    }
}
