//
//  RoundImaveView.swift
//  VendingMachineApp
//
//  Created by yuaming on 14/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    override func awakeFromNib() {
        setup()
        super.awakeFromNib()
    }
    
    func setup() {
        self.layer.cornerRadius = 50.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
    }
}
