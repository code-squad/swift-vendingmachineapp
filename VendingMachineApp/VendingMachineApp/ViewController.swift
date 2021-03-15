//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    private var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet var addPaymentButtons: [UIButton]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBalanceLabel()
        changeBeverageLabel()
        setNotificationObserver()
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: .updateBalance, object: Payment.self)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: .updateBeverage, object: VendingMachine.self)
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        guard let buttonIndex = self.addStockButton.firstIndex(of: sender) else { return }
        self.appDelegate?.vendingMachine?.addStock(buttonIndex: buttonIndex)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        guard let buttonIndex = self.addPaymentButtons.firstIndex(of: sender) else { return }
        self.appDelegate?.vendingMachine?.putPayMoney(buttonIndex: buttonIndex)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(self.appDelegate?.vendingMachine?.checkCurrentBalance() ?? 0)
    }
    
    private func changeBeverageLabel() {
        appDelegate?.vendingMachine?.showAllBeverageStock { index, count in
            self.numberOfStock[index].text = String(count)
        }
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        appDelegate?.vendingMachine?.showDrinkMenuList().enumerated().forEach {
            let notification = notification.userInfo?["drinklist"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[$0.offset].text = String(notification?[ObjectIdentifier(type(of: $0.element))]?.count ?? 0)
        }
    }
}
