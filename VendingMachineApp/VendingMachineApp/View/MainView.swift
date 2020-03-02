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
}

class MainView: UIView {
    weak var someDelegate: SomeDelegate?
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var addBalanceButtons: [UIButton]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        someDelegate?.addBalance(amount: sender.tag)
    }
    @IBAction func addStockButtonTapped(_ sender: UIButton) {
        someDelegate?.addStock(index: sender.tag)
    }
    
    override func layoutSubviews() {
        stockImageViews.forEach {
            $0.image = UIImage(imageLiteralResourceName: "\(someDelegate?.stockList[$0.tag] ?? "").png")
        }
    }
}

extension MainView: AnyDelegate {
    func updateBalanceLabel(amount: String) {
        balanceLabel.text = "잔액: " + amount + "원"
    }
}
