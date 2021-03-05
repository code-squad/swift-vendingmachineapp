//
//  StockStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class StockHorizontalStackView: UIStackView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    func configure(){
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
