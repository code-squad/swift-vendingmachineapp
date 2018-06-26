//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 22..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBeverageInitStock()
        updateStockLabels()
        updateBalanceLabel()
        setupStockImageViews()
    }
    
    func setupBeverageInitStock() {
        vendingMachine.addBeverage(StrawberryMilk.self, 3)
        vendingMachine.addBeverage(BananaMilk.self, 2)
        vendingMachine.addBeverage(Coke.self, 3)
        vendingMachine.addBeverage(TOP.self, 4)
        vendingMachine.addBeverage(Sprite.self, 2)
    }
    
    func updateStockLabels() {
        for index in stockLabels.indices {
            self.stockLabels[index].text = String(self.vendingMachine.readStock(index)) + "개"
        }
    }
    
    func updateBalanceLabel() {
        self.balanceLabel.text = String(format: "%d원", vendingMachine.readBalance())
    }
    
    func setupStockImageViews() {
        self.stockImageViews.indices.forEach {
            let imageName = String(format: "imgsource/%d.png", $0)
            stockImageViews[$0].image = UIImage(named: imageName)
            stockImageViews[$0].backgroundColor = UIColor.white
            stockImageViews[$0].layer.borderWidth = 1.0
            stockImageViews[$0].layer.borderColor = UIColor.black.cgColor
            stockImageViews[$0].contentMode = UIViewContentMode.scaleAspectFit
            stockImageViews[$0].layer.cornerRadius = 20
            stockImageViews[$0].layer.masksToBounds = true
        }
    }

    @IBAction func addStock(_ sender: UIButton) {
        guard let buttonIndex = self.addStockButtons.firstIndex(of: sender) else {
            return
        }
        guard let beverageType = buttonIndex.beverageType else {
            return
        }
        vendingMachine.addBeverage(beverageType)
        updateStockLabels()
    }
    
    @IBAction func insertMoney(_ sender: UIButton) {
        let money: Int = Int(sender.titleLabel?.text ?? "") ?? 0
        vendingMachine.insertMoney(money)
        updateBalanceLabel()
    }
}
