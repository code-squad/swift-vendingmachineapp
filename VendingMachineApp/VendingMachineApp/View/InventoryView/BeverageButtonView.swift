//
//  BeverageButtonView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/17.
//

import UIKit

class UIAddBeverageButtonView: UIButton {

    var beverageType: Beverage.Type
    
    override init(frame: CGRect) {
        beverageType = Beverage.self
        super.init(frame: frame)
        buttonAction()
    }
    
    required init?(coder: NSCoder) {
        beverageType = Beverage.self
        super.init(coder: coder)
        buttonAction()
    }
    
    init(frame: CGRect, type: Beverage.Type) {
        self.beverageType = type
        super.init(frame: frame)
        buttonAction()
    }
    
    func buttonAction() {
        self.addTarget(superview, action: #selector(ViewController.addBeverage), for: .touchDown)
    }
    
}
