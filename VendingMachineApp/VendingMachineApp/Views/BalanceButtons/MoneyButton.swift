//
//  PlusBalanceButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class MoneyButton: UIButton {
    var instantiator: MoneyInstantiator? { return nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
