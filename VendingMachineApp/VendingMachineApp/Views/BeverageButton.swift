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
        configureBeverageItemByTag()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureBeverageItemByTag()
    }
    
    private func configureBeverageItemByTag() {
        beverageItemByTag = BeverageItemByTag(rawValue: tag)
    }
}
