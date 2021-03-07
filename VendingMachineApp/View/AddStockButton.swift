//
//  AddButton.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

protocol  StockButtonDelegate {
    func append(type: Beverage.Type)
}

class AddStockButton: UIButton {
    
    var beverageType : Beverage.Type = Beverage.self
    var delegate : StockButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    init(frame : CGRect, beverageType : Beverage.Type) {
        super.init(frame: frame)
        self.beverageType = beverageType
        configure()
    }
    func configure(){
        self.setTitle("추가하기", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setBackgroundImage(UIImage(named: "button"), for: .normal)
        self.addTarget(self, action: #selector(append), for: .touchDown)
    }
    @objc func append(_ sender : AddStockButton){
        delegate?.append(type: sender.beverageType)
    }
}
