//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 04/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    override func awakeFromNib() {
        layer.cornerRadius =  10
    }
}
