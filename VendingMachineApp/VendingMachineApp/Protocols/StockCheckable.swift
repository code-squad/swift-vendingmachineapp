//
//  StockCheckable.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 12..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

protocol StockCheckable {
    func updateStockLabels()
    var stockLabels: [UILabel]! { get set }
}

extension StockCheckable {
    func updateStockLabels() {
        for index in stockLabels.indices {
            self.stockLabels[index].text = String(format: "%d개", VendingMachine.shared().readStock(index))
        }
    }
}
