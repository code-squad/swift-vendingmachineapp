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
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        beverageType = Beverage.self
        super.init(coder: aDecoder)
        setUpButton()
    }
    func setType(with type : Beverage.Type){
        beverageType = type
    }
    func setUpButton() {
        self.setImage(UIImage(named: "button"), for: .normal)
        self.addTarget(superview, action: #selector(ViewController.appendBeverageToMachine), for: .touchDown)
    }
    
}
