//
//  UICoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import UIKit

class UICoinButton: UIButton {

    let value : Amount!
    
    enum Amount : Int, CaseIterable {
        case oneThousand = 1000
        case fiveThusand = 5000
    }
    
    override init(frame: CGRect) {
        self.value = .none
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.value = .none
        super.init(coder: aDecoder)
        setUpButton()
    }
    init(frame : CGRect, with coin : Amount){
        self.value = coin
        super.init(frame: frame)
        setUpButton()
        setButtonTitle()
    }
    func setUpButton() {
        self.setImage(UIImage(named: "coinbutton"), for: .normal)
    }
    func setButtonTitle(){
        let title = "\(self.value.rawValue)원"
        self.setTitle(title, for: .normal)
    }
    func bind(handler action : UIAction){
        self.addAction(action, for: .touchDown)
    }
}

