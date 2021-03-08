//
//  StockLabel.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class StockLabel: UILabel {
    func setting(count : Int) {
        self.text = "\(count)개"
    }
}
