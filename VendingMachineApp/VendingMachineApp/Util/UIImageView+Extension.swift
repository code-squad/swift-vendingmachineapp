//
//  UIImageView+Extension.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 04/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeRounded(radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
}
