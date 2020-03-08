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
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var stockCountLabel: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var addMoneyButton: [UIButton]!
    @IBOutlet var balanceLabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         setUI()
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
        updateBeverageCount()
    }
    
    @IBAction func addMoney(button: UIButton) {
        vendingMachine.raiseMoney(index: button.tag)
        updateBalanceLabel()
    }
    
    func updateBeverageCount() {
        let totalStock = vendingMachine.reportTotalStock()
        for (beverage, count) in totalStock {
            if vendingMachine.products.contains(beverage), let index = vendingMachine.products.firstIndex(of: beverage) {
                stockCountLabel[index].text = String(count)
            }
        }
    }
    
    func updateBalanceLabel() {
        balanceLabel.text = String(vendingMachine.confirmBalance().balance)
    }
    
}

