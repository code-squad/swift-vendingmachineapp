//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class BeverageNumberLabel: UILabel, BeverageTagControl {
    var beverageItemByTag: BeverageItemByTag?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initBeverageItemByTag()
    }
    
    private func initBeverageItemByTag() {
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
            return Cantata(cantataBuilder: Cantatas.builderPrimiumLatte175ml,
                           celsius: 65)
        case .cantataPrimiumLatte275ml:
            return Cantata(cantataBuilder: Cantatas.builderPrimiumLatte275ml,
                           celsius: 65)
        case .pepsiDietCola250ml:
            return Pepsi(pepsiBuilder: Pepsis.builderDietCola250ml)
        case .pepsiDietCola591ml:
            return Pepsi(pepsiBuilder: Pepsis.builderDietCola591ml)
        case .hersheyCookieCream235ml:
            return HersheyChocolateDrink(hersheyBuilder:
                HersheyChocolateDrinks.builderCookieCream235ml)
        case .hersheyCookieCream350ml:
            return HersheyChocolateDrink(hersheyBuilder:
                HersheyChocolateDrinks.builderCookieCream350ml)
        }
    }
}
