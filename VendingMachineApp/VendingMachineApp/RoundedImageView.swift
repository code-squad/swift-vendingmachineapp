//
//  CustomUIImageView.swift
//  VendingMachineApp
//
//  Created by oingbong on 18/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
    }
}
