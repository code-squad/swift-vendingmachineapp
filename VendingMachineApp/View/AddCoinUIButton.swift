//
//  AddCoinButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/06.
//

import UIKit

protocol CoinDelegate {
    func addCoin(_ sender : AddCoinUIButton)
}

class AddCoinUIButton: UIButton {
    
    var delegate : CoinDelegate?
    var value : Int = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(frame: CGRect ,named : String){
        super.init(frame: frame)
        self.setTitle(named, for: .normal)
        self.value = named.extractUnsignedInteger()
        configure()
    }
    
    func configure(){
        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.addTarget(self, action: #selector(addCoin), for: .touchUpInside)
    }
    
    @objc func addCoin(_ sender : AddCoinUIButton!){
        delegate?.addCoin(sender)
    }
}
