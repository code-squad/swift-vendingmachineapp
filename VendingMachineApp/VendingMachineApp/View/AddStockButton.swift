//
//  addStockButton.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class AddStockButton : UIButton {
    override init(frame: CGRect) {//, action:(()->Void)) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setting() {//action:(()->Void)) {
        self.setTitle("추가", for: .normal)
        self.setTitleColor(.blue, for: .normal)
//        self.addTarget(self, action: action, for: .touchUpInside)
    }
}
