//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 22..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        updateBalanceLabel()
        setupStockImageViews()
        setupNotification()
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeBalance(notification:)), name: .didChangeBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeStock(notification:)), name: .didChangeStock, object: nil)
    }
    
    @objc private func didChangeBalance(notification: Notification) {
        guard let balance = notification.userInfo?["balance"] as? Int else {
            return
        }
        self.balanceLabel.text = String(format: "%d원", balance)
    }
    
    @objc private func didChangeStock(notification: Notification) {
        self.updateStockLabels()
    }
    
    private func updateStockLabels() {
        for index in stockLabels.indices {
            self.stockLabels[index].text = String(VendingMachine.shared().readStock(index)) + "개"
        }
    }
    
    private func updateBalanceLabel() {
        self.balanceLabel.text = String(format: "%d원", VendingMachine.shared().readBalance())
    }
    
    private func setupStockImageViews() {
        self.stockImageViews.indices.forEach {
            let imageName = String(format: "imgsource/%d.png", $0)
            stockImageViews[$0].image = UIImage(named: imageName)
            stockImageViews[$0].backgroundColor = UIColor.white
            stockImageViews[$0].layer.borderWidth = 1.0
            stockImageViews[$0].layer.borderColor = UIColor.black.cgColor
            stockImageViews[$0].contentMode = UIViewContentMode.scaleAspectFit
            stockImageViews[$0].layer.cornerRadius = 20
            stockImageViews[$0].layer.masksToBounds = true
        }
    }

    @IBAction func addStock(_ sender: UIButton) {
        guard let buttonIndex = self.addStockButtons.index(of: sender) else {
            return
        }
        guard let beverage = BeverageFactory.makeBeverage(meunNumber: buttonIndex) else {
            return
        }
        VendingMachine.shared().addBeverage(beverage)
    }
    
    @IBAction func insertMoney(_ sender: UIButton) {
        let money: Int = Int(sender.titleLabel?.text ?? "") ?? 0
        VendingMachine.shared().insertMoney(money)
    }
}
