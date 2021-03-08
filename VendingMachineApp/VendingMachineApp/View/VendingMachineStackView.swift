//
//  VendingMachineStackView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class VendingMachineStackView : UIStackView {
    func setting() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.spacing = 15
        self.distribution = .fillEqually
    }
    
    func positionSetting() {
        self.topAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.topAnchor)!, constant: 50).isActive = true
        self.leadingAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.leadingAnchor)!, constant: 10).isActive = true
        self.trailingAnchor.constraint(equalTo: (superview?.safeAreaLayoutGuide.trailingAnchor)!, constant: -10).isActive = true
    }
}
