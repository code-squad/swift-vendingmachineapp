//
//  CantataPrimiumLatte275Button.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class CantataPrimiumLatte275Button: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        action?(Cantata(
            milkContentRate: Cantatas.PriumLatte.milkContentRate,
            sugarContentRate: Cantatas.PriumLatte.milkContentRate,
            celsius: 65,
            brand: Cantatas.brand,
            name: Cantatas.PriumLatte.name,
            volume: Cantatas.PriumLatte.Volume275ml.volume,
            price: Cantatas.PriumLatte.Volume275ml.price
        ))
    }
}
