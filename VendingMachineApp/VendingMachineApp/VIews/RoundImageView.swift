//
//  RoundImaveView.swift
//  VendingMachineApp
//
//  Created by yuaming on 14/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setRoundedImage() {
        self.layer.cornerRadius = 50.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
    }
}
