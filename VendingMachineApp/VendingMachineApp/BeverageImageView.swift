//
//  BeverageImageView.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 3. 22..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class BeverageImageView: UIImageView {

    override func awakeFromNib() {
        self.setBeverageImage()
    }

    private func setBeverageImage() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 8.0
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
