//
//  AddCoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/06.
//

import UIKit

protocol CoinDelegate {
    func addCoin(_ sender : UIButton)
}

class AddCoinUIButton: UIButton {
    
    var delegate : CoinDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    init(frame : CGRect, named : String){
        super.init(frame: frame)
        self.setTitle(named, for: .normal)
    }
    func configure(){
        self.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 10)
        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.addTarget(self, action: #selector(addCoin), for: .touchUpInside)
    }
    
    @objc func addCoin(_ sender : UIButton!){
        delegate?.addCoin(sender)
    }
}
