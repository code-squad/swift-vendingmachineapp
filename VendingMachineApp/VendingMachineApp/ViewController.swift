//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var addStockButton: [BeveragesButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeBalanceLabel()
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: BeveragesButton) {
        sender.increase(action: { (beverage) in
            self.appDelegate.vendingMachine.addStock(beverage: beverage)
            self.numberOfStock[sender.tag].text = String(self.appDelegate.vendingMachine.countDrink(beverage: beverage))
        })
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase { money in
            self.appDelegate.vendingMachine.putPayMoney(money: money)
            self.changeBalanceLabel()
        }
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text = String(self.appDelegate.vendingMachine.checkCurrentBalance())
    }
}

