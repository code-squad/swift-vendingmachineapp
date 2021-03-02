//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/01.
//

import UIKit

class BeverageStackView : UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func configure() {
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .fill
        self.distribution = .fillEqually
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

