//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UICoinButton: UIButton {

    let coin : Int
    
    override init(frame: CGRect) {
        coin = 0
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        coin = 0
        super.init(coder: aDecoder)
        setUpButton()
    }
    init(frame: CGRect, title : String){
        coin = title.extractUnsignedInteger()
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        setUpButton()
    }
    
    func setUpButton() {
        self.setImage(UIImage(named: "button"), for: .normal)
        self.addTarget(superview, action: #selector(ViewController.appedCoinToMachine), for: .touchDown)
    }

}

