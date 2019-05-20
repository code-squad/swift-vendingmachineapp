//
//  RoundImageView.swift
//  VendingMachineApp
//
//  Created by Elena on 20/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView{
    
    var roundImageView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
}
