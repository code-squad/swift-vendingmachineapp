//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UIBeverageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func bind(action : UIAction){
        self.addAction(action, for: .touchDown)
    }
}
