//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UIBeverageButton: UIButton {
    
    enum ButtonType {
        case add
        case buy
    }
    internal let buttonAction : ButtonType!
    
    override init(frame: CGRect) {
        self.buttonAction = .none
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        self.buttonAction = .none
        super.init(coder: aDecoder)
    }
    init(frame : CGRect, type : ButtonType){
        self.buttonAction = type
        super.init(frame: frame)
    }
    func bind(action : UIAction){
        self.addAction(action, for: .touchDown)
    }
}
