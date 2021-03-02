//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let vendingMachine = VendingMachine()
    private let vendingStackView = VendingStackView()
    
    private let strawberryMilk = StrawberryMilk()
    private let dietCola =  DietCola()
    private let topAmericano = TopAmericano()
    
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageCornerRadius()
        addBeverage()
        
    }
    
    private func addBeverage() {
        vendingMachine.addStock(beverage: strawberryMilk)
        vendingMachine.addStock(beverage: dietCola)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
    }
    
    private func setImageCornerRadius() {
        beverageImages.forEach { (image) in
            image.layer.cornerRadius = 30
        }
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase { money in
            self.vendingMachine.putPayMoney(money: money)
        }
    }
}

