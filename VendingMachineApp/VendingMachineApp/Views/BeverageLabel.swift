//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class BeverageLabel: UILabel, BeverageTagControl {
    var beverageItemByTag: BeverageItemByTag?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBeverageItemByTag()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureBeverageItemByTag()
    }
    
    private func configureBeverageItemByTag() {
        beverageItemByTag = BeverageItemByTag(rawValue: tag)
    }
    
    func update(number: Int) {
        text = "\(number)개"
    }
}

enum BeverageItemByTag: Int {
    case cantataPrimiumLatte175ml = 0
    case cantataPrimiumLatte275ml
    case pepsiDietCola250ml
    case pepsiDietCola591ml
    case hersheyCookieCream235ml
    case hersheyCookieCream350ml
    
    func beverage() -> Beverage {
        switch self {
        case .cantataPrimiumLatte175ml:
            return Cantatas.builderPrimiumLatte175ml
        case .cantataPrimiumLatte275ml:
            return Cantatas.builderPrimiumLatte275ml
        case .pepsiDietCola250ml:
            return Pepsis.builderDietCola250ml
        case .pepsiDietCola591ml:
            return Pepsis.builderDietCola591ml
        case .hersheyCookieCream235ml:
            return HersheyChocolateDrinks.builderCookieCream235ml
        case .hersheyCookieCream350ml:
            return HersheyChocolateDrinks.builderCookieCream350ml
        }
    }
}
