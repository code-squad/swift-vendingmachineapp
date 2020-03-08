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
    var selectedIndex = -1
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addBalaceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func addStock(_ sender: UIButton) {
        selectedIndex = sender.tag
        vendingMachine.insert(beverageNumber: sender.tag)
    }
    
    @IBAction func addBalance(_ sender: UIButton) {
        vendingMachine.add(balance: sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNotificationObserver()
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
        balanceLabel.text = "잔액: \(vendingMachine.balance.money)"
    }
    
    func setupStockLabels() {
        let kindOfBeverages = vendingMachine.kindOfBeverages()
        if kindOfBeverages.count == 0 {
            stockLabels.forEach{
                $0.text = String(0)
            }
        }
    }
    
    func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(_:)),
                                               name: Notification.Name.updateStock,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateBalance(_:)),
                                               name: Notification.Name.updateBalance,
                                               object: nil)
    }
    
    @objc func updateStockLabel(_ notification: Notification) {
        if let stock: Int = notification.userInfo?["stock"] as? Int {
            stockLabels[selectedIndex].text = String(stock)
        }
        
    }
    
    @objc func updateBalance(_ notification: Notification) {
        if let balance: Int = notification.userInfo?["balance"] as? Int {
            balanceLabel.text = "잔액: \(balance)"
        }
    }
}

