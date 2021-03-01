//
//  VendingStackView.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/27.
//

import Foundation
import UIKit

class VendingStackView : UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.axis = .horizontal
        self.spacing = 10
        self.alignment = .fill
        self.distribution = .fillEqually
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
