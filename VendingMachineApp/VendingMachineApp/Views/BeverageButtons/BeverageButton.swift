//
//  BeverageButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BeverageButton: UIButton {
    
    var action: ((Beverage) -> Void)?
    
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
