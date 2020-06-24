//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class BeverageLabel: UILabel, BeverageGeneratable {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func update(number: Int) {
        text = "\(number)개"
    }
    
    func instantiator() -> BeverageInstantiator? { return nil }
}
