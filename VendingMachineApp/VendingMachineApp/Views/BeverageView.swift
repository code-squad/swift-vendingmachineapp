//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PlusBeverageButton: UIButton {
    
    private lazy var itemByTag = ItemByTag(rawValue: tag)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

final class BeverageNumberLabel: UILabel {

    private lazy var itemByTag = ItemByTag(rawValue: tag)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

enum ItemByTag: Int {
    
    case cantataPrimiumLatte175ml = 0
    case cantataPrimiumLatte275ml
    case pepsiDietCola250ml
    case pepsiDietCola591ml
    case hersheyCookieCream235ml
    case hersheyCookieCream350ml
    
}

