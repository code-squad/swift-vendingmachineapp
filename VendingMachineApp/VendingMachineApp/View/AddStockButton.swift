//
//  addStockButton.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class AddStockButton : UIButton {
    
    var beverageType : Drink
        
    init(frame: CGRect, type: Drink) {
        beverageType = type
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder, type: Drink) {
        beverageType = Drink()
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setting() {
        self.setTitle("추가", for: .normal)
        self.setTitleColor(.blue, for: .normal)
    }
}
