//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    private var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var addStockButton: [BeveragesButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBalanceLabel()
        changeBeverageLabel()
        setNotificationObserver()
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(_:)), name: .updateBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel(_:)), name: .updateBeverage, object: nil)
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: BeveragesButton) {
        sender.increase(action: { (beverage) in
            self.appDelegate?.vendingMachine?.addStock(beverage: beverage)
        })
    }
    
    @IBAction func BalanceIncrease1000ButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase(balance: 1000) { money in
            self.appDelegate?.vendingMachine?.putPayMoney(money: money)
        }
    }
    @IBAction func BalanceIncrease5000ButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase(balance: 5000) { money in
            self.appDelegate?.vendingMachine?.putPayMoney(money: money)
        }
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(self.appDelegate?.vendingMachine?.checkCurrentBalance() ?? 0)
    }
    
    @objc private func updateBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateBeverageLabel(_ notification : Notification) {
        appDelegate?.vendingMachine?.showMenuList().enumerated().forEach {
            let notification = notification.userInfo?["beverageInfo"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[$0.offset].text = String(notification?[ObjectIdentifier(type(of: $0.element))]?.count ?? 0)
        }
    }
    
    private func changeBeverageLabel() {
        appDelegate?.vendingMachine?.showAllBeverageStock { index, count in
            self.numberOfStock[index].text = String(count)
        }
    }
}
