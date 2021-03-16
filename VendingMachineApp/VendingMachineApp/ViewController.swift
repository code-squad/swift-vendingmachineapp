//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController ,VendingMachinedable {
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet var addPaymentButtons: [UIButton]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    var vendingMachine : VendingMachined!
    private var paymentMenu : PaymentMenu!
    private var drinkMenu : DrinkMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkMenu = DrinkMenu(drinkButtons: addStockButton)
        paymentMenu = PaymentMenu(buttons: addPaymentButtons)
        changeBalanceLabel()
        changeBeverageLabel()
        setNotificationObserver()
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: VendingMachine.updateBalance, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.updateBeverage, object: vendingMachine)
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        guard let beverageType = drinkMenu.addMenu(button: sender) else { return }
        let beverage = BeverageFactory.make(beverageType)
        vendingMachine.addStock(beverage)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        let money = paymentMenu.add(button : sender)
        vendingMachine.putPayMoney(money: money)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(vendingMachine.checkCurrentBalance())
    }
    
    private func changeBeverageLabel() {
        drinkMenu.drinkList.enumerated().forEach { index , drinkType in
            self.numberOfStock[index].text = String(vendingMachine.showBeverageStock(drinkType: drinkType))
        }
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        drinkMenu.drinkList.enumerated().forEach { index, drinkType in
            let notification = notification.userInfo?["drinklist"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[index].text =
                String(notification?[ObjectIdentifier(drinkType)]?.count ?? 0)
        }
        
    }
}
