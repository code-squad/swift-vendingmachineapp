//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 26..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import Foundation
import UIKit

class RoundImageView: UIImageView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.width/4
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 5
        self.clipsToBounds = true
    }
}
