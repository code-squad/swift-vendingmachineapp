//
//  AddButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class AddStockButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    func configure(){
        self.setTitle("추가하기", for: .normal)
    }
}
