//
//  BeverageLabel.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageLabel: UILabel {
    
    enum Item: Int {
        case coke = 101
        case fanta, strawberryMilk, chocolateMilk, georgia, top
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
}

extension BeverageLabel {
    var beverageType: Item? {
        return Item(rawValue: tag)
    }
    
    func update(value: Int?) {
        text = "\(value ?? 0)"
    }
}
