//
//  MainView.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class MainView: UIView {
    weak var vendingMachineManager: VendingMachineManagementDelegate?
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var addBalanceButtons: [UIButton]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    @IBOutlet var stockCountLabels: [UILabel]!
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        vendingMachineManager?.addBalance(amount: sender.tag)
    }
    
    @IBAction func addStockButtonTapped(_ sender: UIButton) {
        vendingMachineManager?.addStock(index: sender.tag)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        stockImageViews.forEach {
            $0.image = UIImage(imageLiteralResourceName: "\(vendingMachineManager?.stockNames[$0.tag] ?? "").png")
            $0.layer.cornerRadius = 30
        }
    }
    
    func updateBalanceLabel(amount: String) {
        balanceLabel.text = "잔액: " + amount + "원"
    }
    
    func updateStockCountLabels(stockList: [(key: Beverage, value: Int)]) {
        stockCountLabels.forEach {
            $0.text = "\(stockList[$0.tag].value)개"
        }
    }

}


    
