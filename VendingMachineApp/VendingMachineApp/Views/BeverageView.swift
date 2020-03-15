//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol BeverageTagControl {
    
    func kind() -> Beverage.Kind?
    
}

final class PlusBeverageButton: UIButton, BeverageTagControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func kind() -> Beverage.Kind? {
        return BeverageItemByTag(rawValue: tag)?.kind()
    }
    
}

final class BeverageNumberLabel: UILabel, BeverageTagControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func kind() -> Beverage.Kind? {
        return BeverageItemByTag(rawValue: tag)?.kind()
    }
    
}

enum BeverageItemByTag: Int {
    
    case cantataPrimiumLatte175ml = 0
    case cantataPrimiumLatte275ml
    case pepsiDietCola250ml
    case pepsiDietCola591ml
    case hersheyCookieCream235ml
    case hersheyCookieCream350ml
    
    func kind() -> Beverage.Kind {
        switch self {
        case .cantataPrimiumLatte175ml:
            return Beverage.Kind(name: Cantatas.PriumLatte.name,
                                 price: Cantatas.PriumLatte.Volume175ml.price)
        case .cantataPrimiumLatte275ml:
            return Beverage.Kind(name: Cantatas.PriumLatte.name,
                                 price: Cantatas.PriumLatte.Volume275ml.price)
        case .pepsiDietCola250ml:
            return Beverage.Kind(name: Pepsis.DietCola.name,
                                 price: Pepsis.builderDietCola250ml.price)
        case .pepsiDietCola591ml:
            return Beverage.Kind(name: Pepsis.DietCola.name,
                                 price: Pepsis.builderDietCola591ml.price)
        case .hersheyCookieCream235ml:
            return Beverage.Kind(name: HersheyChocolateDrinks.CookieCream.name,
                                 price: HersheyChocolateDrinks.CookieCream.Volume235ml.price)
        case .hersheyCookieCream350ml:
            return Beverage.Kind(name: HersheyChocolateDrinks.CookieCream.name,
            price: HersheyChocolateDrinks.CookieCream.Volume350ml.price)
        }
    }
    
}

