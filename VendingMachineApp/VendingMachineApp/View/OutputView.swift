//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class OutputView: UIView {
    func setting() {
        let beverageStackView = BeverageStackView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.addSubview(beverageStackView)
        
    }
}
