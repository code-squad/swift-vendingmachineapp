//
//  BeveragesButton.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation
import UIKit

class BeveragesButton : UIButton {
    
    var action : ((Beverage)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTarget()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTarget()
    }
    
    private func setTarget() {
        self.addTarget(self, action: #selector(touch(_:)), for: .touchUpInside)
    }
    
    @objc func touch(_ sender : UIButton) {
    }
    
    func increase(action : ((Beverage) -> Void)?) {}
}
