//
//  BeverageLabel.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageLabel: UILabel {
    
    private enum Item: Int {
        case coke = 101
        case fanta, strawberryMilk, chocolateMilk, georgia, top
        
        var type: Beverage {
            switch self {
            case .coke: return Coke()
            case .fanta: return Fanta()
            case .strawberryMilk: return StrawberryMilk()
            case .chocolateMilk: return ChocolateMilk()
            case .georgia: return Georgia()
            case .top: return Top()
            }
        }
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
    var beverageType: Beverage? {
        return Item(rawValue: tag)?.type
    }
    
    func update(value: Int?) {
        text = "\(value ?? 0)"
    }
}
