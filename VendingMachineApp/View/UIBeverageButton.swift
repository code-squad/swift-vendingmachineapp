//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UIBeverageButton: UIButton {
    
    public var beverageType : Beverage.Type
    
    override init(frame: CGRect) {
        beverageType = Beverage.self
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        beverageType = Beverage.self
        super.init(coder: aDecoder)
    }
    func setType(with type : Beverage.Type){
        beverageType = type
    }
    func setUpButton() {
        self.addTarget(superview, action: #selector(AdminViewController.appendBeverageToMachine), for: .touchDown)
    }    
}
