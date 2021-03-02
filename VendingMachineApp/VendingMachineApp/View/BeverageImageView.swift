//
//  BeverageImageView.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation
import UIKit

class BeverageImageView : UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConfigure()
    }
    
    func setConfigure() {
        self.layer.cornerRadius = 30
    }
}
