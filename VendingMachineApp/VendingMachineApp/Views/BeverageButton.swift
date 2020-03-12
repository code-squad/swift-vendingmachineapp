//
//  BeverageButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageButton: UIButton {
    
    private enum Action: Int {
        case coke = 201
        case fanta, strawberryMilk, chocolateMilk, georgia, top
        
        var invoke: (() -> Beverage) {
            switch self {
            case .coke: return { return Coke() }
            case .fanta: return { return Fanta() }
            case .strawberryMilk: return { return StrawberryMilk() }
            case .chocolateMilk: return { return ChocolateMilk() }
            case .georgia: return { return Georgia() }
            case .top: return { return Top() }
            }
        }
    }
    
    var customAction: ((Beverage) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    deinit {
        self.removeTarget(self, action: #selector(invokeAction), for: .touchUpInside)
    }
}

extension BeverageButton {
    private func setup() {
        self.addTarget(self, action: #selector(invokeAction), for: .touchUpInside)
    }
    
    @objc func invokeAction(sender: BeverageButton) {
        if let beverage = Action(rawValue: tag)?.invoke() {
            customAction?(beverage)
        }
    }
}

