//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vendingMachine = VendingMachine()
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addBalaceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func addStock(_ sender: UIButton) {
        vendingMachine.insert(beverageNumber: VendingMachine.BeverageNumbers.allCases[sender.tag])
    }
    
    @IBAction func addBalance(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(_:)),
                                               name: Notification.Name.updateStock, object: nil)
    }
    
    func setupUI() {
        makeCornerRadius()
        setupBalanceLabel()
        setupStockLabels()
    }
    
    func makeCornerRadius() {
        productImages.forEach{
            $0.layer.cornerRadius = 40
        }
    }
    
    func setupBalanceLabel() {
        balanceLabel.text = "잔액: \(vendingMachine.balance)"
    }
    
    func setupStockLabels() {
        let kindOfBeverages = vendingMachine.kindOfBeverages()
        if kindOfBeverages.count == 0 {
            stockLabels.forEach{
                $0.text = String(0)
            }
        }
    }
    
    @objc func updateStockLabel(_ notification: Notification) {
        if let index: Int = notification.userInfo?["index"] as? Int {
            if let stock: Int = notification.userInfo?["stock"] as? Int {
                stockLabels[index].text = String(stock)
            }
        }
    }
}

