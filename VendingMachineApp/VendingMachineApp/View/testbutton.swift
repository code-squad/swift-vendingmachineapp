//
//  testbutton.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/27.
//

import Foundation
import UIKit

protocol testable {
    func printTest(a : Int)
}

class testButton : UIButton {
    var delegate : testable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addTarget(self, action: #selector(printTest), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func printTest(_ sender : UIButton) {
        delegate?.printTest(a : sender.tag)
    }
    
}
