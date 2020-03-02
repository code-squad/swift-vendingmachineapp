//
//  MainView.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

protocol AnyDelegate: class {
    func updateBalanceLabel(amount: String)
    func updateStockCountLabels(stockList: [(key: Beverage, value: Int)])
}

class MainView: UIView {
    weak var someDelegate: SomeDelegate?
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var addBalanceButtons: [UIButton]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    @IBOutlet var stockCountLabels: [UILabel]!
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        someDelegate?.addBalance(amount: sender.tag)
    }
    @IBAction func addStockButtonTapped(_ sender: UIButton) {
        someDelegate?.addStock(index: sender.tag)
    }
    
    override func layoutSubviews() {
        stockImageViews.forEach {
            $0.image = UIImage(imageLiteralResourceName: "\(someDelegate?.stockNames[$0.tag] ?? "").png")
        }
    }
}

extension MainView: AnyDelegate {
    func updateBalanceLabel(amount: String) {
        balanceLabel.text = "잔액: " + amount + "원"
    }
    
    func updateStockCountLabels(stockList: [(key: Beverage, value: Int)]) {
        stockCountLabels.forEach {
            $0.text = "\(stockList[$0.tag].value)개"
        }
    }
}
