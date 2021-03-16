//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet var addPaymentButtons: [UIButton]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    var vendingMachine : VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = (UIApplication.shared.delegate as? AppDelegate)?.vendingMachine
        
        changeBalanceLabel()
        changeBeverageLabel()
        setNotificationObserver()
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: VendingMachine.updateBalance, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.updateBeverage, object: vendingMachine)
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        guard let buttonIndex = self.addStockButton.firstIndex(of: sender) else { return }
        vendingMachine?.addStock(buttonIndex: buttonIndex)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        guard let buttonIndex = self.addPaymentButtons.firstIndex(of: sender) else { return }
        vendingMachine?.putPayMoney(buttonIndex: buttonIndex)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(vendingMachine?.checkCurrentBalance() ?? 0)
    }
    
    private func changeBeverageLabel() {
        vendingMachine?.showAllBeverageStock { index, count in
            self.numberOfStock[index].text = String(count)
        }
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        vendingMachine?.showDrinkMenuList().enumerated().forEach {
            let notification = notification.userInfo?["drinklist"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[$0.offset].text = String(notification?[ObjectIdentifier(type(of: $0.element))]?.count ?? 0)
        }
    }
}
