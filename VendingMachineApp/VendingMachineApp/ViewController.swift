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
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: BeveragesButton) {
        sender.increase(action: { (beverage) in
            self.appDelegate?.vendingMachine?.addStock(beverage: beverage)
            self.changeBeverageLabel()
        })
    }
    
    @IBAction func BalanceIncrease1000ButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase(balance: 1000) { money in
            self.appDelegate?.vendingMachine?.putPayMoney(money: money)
            self.changeBalanceLabel()
        }
    }
    @IBAction func BalanceIncrease5000ButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase(balance: 5000) { money in
            self.appDelegate?.vendingMachine?.putPayMoney(money: money)
            self.changeBalanceLabel()
        }
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text = String(self.appDelegate?.vendingMachine?.checkCurrentBalance() ?? 0)
    }
    
    private func changeBeverageLabel() {
        let beverage = appDelegate?.vendingMachine?.showAllBeverageStock()
        appDelegate?.vendingMachine?.showMenuList().enumerated().forEach {
            self.numberOfStock[$0.offset].text =
                String(beverage?[ObjectIdentifier(type(of: $0.element))]?.count ?? 0)
        }
    }
}

