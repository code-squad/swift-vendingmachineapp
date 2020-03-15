//
//  AddStockButton.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/15.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class AddStockButton: UIButton {
    
    var beverage: Beverage
    
    override init(frame: CGRect) {
        self.beverage = Beverage()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.beverage = Beverage()
        super.init(coder: coder)
    }
    
}
