//
//  Buttons.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/05.
//

import Foundation
import UIKit

class AddBeverageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButton()
    }
    
    func setButton() {
        self.setTitle("추가", for: .normal)
    }
}
