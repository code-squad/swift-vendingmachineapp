//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class BeverageButton: UIButton, BeverageTagControl {
    var beverageItemByTag: BeverageItemByTag?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initBeverageItemByTag()
    }
    
    private func initBeverageItemByTag() {
        beverageItemByTag = BeverageItemByTag(rawValue: tag)
    }
}
