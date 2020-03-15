//
//  BeverageButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageButton: UIButton {
    
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
    
    @objc func invokeAction(sender: BeverageButton) { }
}

final class CokeButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(Coke())
    }
}

final class FantaButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(Fanta())
    }
}

final class StrawberryMilkButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(StrawberryMilk())
    }
}

final class ChocolateMilkButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(ChocolateMilk())
    }
}

final class TopButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(Top())
    }
}

final class GeorgiaButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        customAction?(Georgia())
    }
}
