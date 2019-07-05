//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/5/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    override func awakeFromNib() {
        self.layer.cornerRadius = 15
    }
}
