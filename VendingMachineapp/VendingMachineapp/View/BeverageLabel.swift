//
//  BeverageLabel.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/08.
//

import Foundation
import UIKit
class BeverageLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLabel()
    }
    
    func setLabel() {
        self.text = "0"
    }
}
