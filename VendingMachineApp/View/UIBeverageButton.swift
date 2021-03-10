//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UIBeverageButton: UIButton {
    
    let beverageType : Beverage.Type
    
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
    init(frame: CGRect, type : Beverage.Type){
        self.beverageType = type
        super.init(frame: frame)
        setUpButton()
    }
    
    func setUpButton() {
        self.setTitle("추가하기", for: .normal)
        self.setImage(UIImage(named: "button"), for: .normal)
        self.addTarget(superview, action: #selector(ViewController.appendBeverageToMachine), for: .touchDown)
    }
    
}
