//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

// MARK: - NSNotification.Name
extension NSNotification.Name {
    static let addBeverage = NSNotification.Name(rawValue: "addBeverage")
    static let insertMoney = NSNotification.Name(rawValue: "insertMoney")
    static let purchaseList = NSNotification.Name(rawValue: "purchaseList")
}

class ViewController: UIViewController {
    
    // MARK: - private variable
    private var vendingMachine: VendingMachine?
    
    // MARK: - @IBOutlet
    @IBOutlet var beverageImageView: [RoundImageView]!
    @IBOutlet var beverageLabel: [UILabel]!
    @IBOutlet weak var list: UILabel!
    @IBOutlet var buyButton: [UIButton]!

    // MARK: - init
    required init?(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine.shared
        super.init(coder: aDecoder)
    }
    
    // MARK: - private
    private func showQuantity() {
        for (index, count) in beverageLabel.enumerated() {
            if let number = vendingMachine?.count(beverage: index) {
                count.text = "\(number)개"
                continue
            }
            count.text = "0개"
        }
    }
    
    private func moneyFormat(money: Int) {
        self.list.text = "\(money.commaRepresentation)"
    }

    // MARK: - @IBAction
    @IBAction func addBeverage(_ sender: UIButton) {
        let beverage = sender.tag
        guard vendingMachine?.add(beverage: beverage) ?? false else { return }
        
        showQuantity()
    }
    
    @IBAction func buyBeverage(_ sender: UIButton) {
        guard let beverage = BeverageTypeName(rawValue: sender.tag) else { return }
        guard vendingMachine?.buyBeverage(beverage: beverage) != nil else { return }
        showQuantity()
        vendingMachine?.showList(show: moneyFormat)
    }
    
    @IBAction func inputMoney(_ sender: UIButton) {
        switch sender.tag {
        case 0: vendingMachine?.isPut(cash: AvailableMoney.oneThousand.value)
        case 1: vendingMachine?.isPut(cash: AvailableMoney.fiveThousands.value)
        default:
            return
        }
        vendingMachine?.showList(show: moneyFormat)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(objcShowQuantity), name: .addBeverage, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(objcMoneyFormat), name: .insertMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(objcPurchaseListHistory), name: .purchaseList, object: nil)
        
        showQuantity()
        vendingMachine?.showList(show: moneyFormat)
    }
    
    // MARK: - @objc
    @objc private func objcShowQuantity() {
        showQuantity()
    }
    
    @objc private func objcMoneyFormat(money: Int) {
        moneyFormat(money: money)
    }
    
    @objc func objcPurchaseListHistory(_ notification: Notification) {
      
    }
}
