//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let vendingMachine = VendingMachine()
    
    private let strawberryMilk = StrawberryMilk()
    private let dietCola =  DietCola()
    private let topAmericano = TopAmericano()
    
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    
    @IBOutlet weak var BalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBeverage()
    }
    
    private func addBeverage() {
        vendingMachine.addStock(beverage: strawberryMilk)
        vendingMachine.addStock(beverage: dietCola)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase { money in
            self.vendingMachine.putPayMoney(money: money)
            self.changeBalanceLabel()
        }
    }
    
    func changeBalanceLabel() {
        self.BalanceLabel.text = self.vendingMachine.checkCurrentBalance().description
    }
    
}

