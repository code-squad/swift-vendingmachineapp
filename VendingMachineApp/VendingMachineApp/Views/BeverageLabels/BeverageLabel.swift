//
//  BeverageLabel.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func invokeByType(_ block: (Beverage) -> ()) { }
    
    func update(value: Int?) {
        text = "\(value ?? 0)"
    }
}
