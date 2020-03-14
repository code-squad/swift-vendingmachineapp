//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var vendingMachine = appDelegate.vendingMachine
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addBalaceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func addStock(_ sender: UIButton) {
        let selectedIndex = addStockButtons.enumerated().filter{$0.element == sender}[0].offset
        vendingMachine.insert(beverageNumber: selectedIndex)
    }
    
    @IBAction func addBalance(_ sender: UIButton) {
        let btnIndex = addBalaceButtons.enumerated().filter{$0.element == sender}[0].offset
        vendingMachine.add(moneyNumber: btnIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNotificationObserver()
    }
    
    func setupUI() {
        makeCornerRadius()
        updateBalance(balance: "\(vendingMachine.balance)")
        updateStockLabel()
    }
    
    func makeCornerRadius() {
        productImages.forEach{
            $0.layer.cornerRadius = 40
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
    
    private func updateStockLabel() {
        let kindOfBeverages = vendingMachine.kindOfBeverages()
        for beverageIndex in 0..<VendingMachine.beverageList.count{
            let beverage = VendingMachine.beverageList[beverageIndex]
            if kindOfBeverages.keys.contains("\(beverage)") {
                stockLabels[beverageIndex].text = String(kindOfBeverages["\(beverage)"]!)
            } else {
                stockLabels[beverageIndex].text = String(0)
            }
        }
        
        if kindOfBeverages.count == 0 {
            stockLabels.forEach{
                $0.text = String(0)
            }
        }
    }
    
    private func updateBalance(balance: String) {
        balanceLabel.text = "잔액: \(balance)"
    }
    
    @objc func updateStockLabel(_ notification: Notification) {
        updateStockLabel()
    }
    
    @objc func updateBalance(_ notification: Notification) {
        if let balance: Price = notification.userInfo?["balance"] as? Price {
            updateBalance(balance: "\(balance)")
        }
    }
}

