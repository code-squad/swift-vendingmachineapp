//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by Elena on 20/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView{
    
    static func makeRound(index: [UIImageView]) {
        for num in index {
            num.layer.borderColor = UIColor.gray.cgColor
            num.layer.borderWidth = 2
            num.layer.cornerRadius = 10
        }
    }
}
