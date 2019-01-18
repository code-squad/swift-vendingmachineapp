//
//  ProductImageView.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 18..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class ProductImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 50
        self.backgroundColor = UIColor.white
    }
}
