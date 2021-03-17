//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageButtons: [UIButton]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet var rechargeButtons: [UIButton]!
    
    var vendingMachine = VendingMachine.shared
    var beverageData = BeverageData()
    var rechargeData = RechargeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curveImageVertex()
        beverageData.setUp(buttons: beverageButtons, labels: beverageLabels)
        rechargeData.setUP(buttons: rechargeButtons)
        loadSavedLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel), name: .addStockButton, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(updateRechargeLabel), name: .rechargeButton, object: self)
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let type = beverageData.showType(with: sender) else { return }
        guard let product = BeverageFactory.releaseBeverage(with: type) else { return }
        vendingMachine.addStock(as: product)
    }
    
    @IBAction func rechargeCash(_ sender: UIButton) {
        guard let cash = rechargeData.showCash(with: sender)?.rawValue else { return }
        vendingMachine.rechargeCash(with: cash)
    }
    
    func curveImageVertex() {
        beverageImages.forEach{ (imageView) in
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
        }
    }
    
    func loadSavedLabel() {
        for button in beverageButtons {
            guard let type = beverageData.showType(with: button), let label = beverageData.showLabel(sender: button) else { return }
            let stock = vendingMachine.showStock()[ObjectIdentifier(type)]
            label.text = "\(stock?.count ?? 0)개"
        }
        let money = vendingMachine.showBalance()
        balanceLabel.text = "\(money)원"
    }
    
    @objc
    func updateBeverageLabel(_ notification: Notification) {
        for button in beverageButtons {
            guard let type = beverageData.showType(with: button) else { return }
            guard let label = beverageData.showLabel(sender: button) else { return }
            let stock = vendingMachine.showStock()[ObjectIdentifier(type)]
            label.text = "\(stock?.count ?? 0)개"
        }
    }
    
    @objc
    func updateRechargeLabel(_ notification: Notification) {
        let money = vendingMachine.showBalance()
        balanceLabel.text = "\(money)원"
    }
}
