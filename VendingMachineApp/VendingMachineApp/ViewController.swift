//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine()
    
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockCountLabels: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var addMoneyButtons: [UIButton]!
    @IBOutlet var balanceLabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(_:)), name: .updateBalanceLabel, object: nil)
     }
     
    func setUI() {
       for img in beverageImages {
            img.layer.cornerRadius = 30.0
        }
        for view in backgroundViews {
            view.layer.cornerRadius = 20.0
        }
    }
    
    @IBAction func addStock(button: UIButton) {
        vendingMachine.addStock(button.tag)
        updateBeverageCountLabel()
    }
    
    @IBAction func addMoney(button: UIButton) {
        vendingMachine.raiseMoney(moneyUnit: Money.MoneyUnit(rawValue: button.tag)!)
        NotificationCenter.default.post(name: .updateBalanceLabel, object: nil)
    }
    
    func updateBeverageCountLabel() {
        vendingMachine.forEachBeverageCount {
            stockCountLabels[$1].text = String($0)
        }
    }
    
    @objc func updateBalanceLabel(_ notification: Notification) {
        balanceLabel.text = String(vendingMachine.confirmBalance().description)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .updateBalanceLabel, object: nil)
    }
}

extension Notification.Name {
    static let updateBalanceLabel =  NSNotification.Name(rawValue: "updateBalanceLabel")
}

