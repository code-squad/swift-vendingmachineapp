//
//  StockStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class StocksHorizentalStackView: UIStackView {
    
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
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
