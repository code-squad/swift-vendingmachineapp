//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit
import Combine

class ViewController: UIViewController, Stateful {
    
    @IBOutlet var beverageImageViews: [UIImageView]!
    @IBOutlet var addInventoryButtons: [UIButton]!
    @IBOutlet var beverageCountLabels: [UILabel]!
    @IBOutlet var addBalanceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var purchaseButtons: [UIButton]!
    
    private var moneyPublisher: AnyCancellable!
    private var purchaseHistoryPublisher: AnyCancellable!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalanceLabel()
        configureInventoryObserver()
        configureMoneySubscriber()
    }
    
    private func configureMoneySubscriber() {
        moneyPublisher = NotificationCenter.default
            .publisher(for: VendingMachine.NotificationName.didChangeMoney)
            .sink { notification in
                DispatchQueue.main.async {
                    self.updateBalanceLabel()
                }
            }
    }
    
    private func configurePurchaseHistorySubscriber() {
        purchaseHistoryPublisher = NotificationCenter.default
            .publisher(for: VendingMachine.NotificationName.didUpdatePurchseHistory)
            .sink { notification in
                DispatchQueue.main.async {
                    
                }
            }
    }
    
    private func configureInventoryObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBeverageCountLabels), name: VendingMachine.NotificationName.didChangeInventory, object: nil)
    }
    
    private func updateBalanceLabel() {
        self.balanceLabel.text = "잔액: \(self.vendingMachine.readBalance()) 원"
    }
    
    func configureBeverageCountLabels() {
        for index in beverageCountLabels.indices {
            self.beverageCountLabels[index].text = "\(self.vendingMachine.readInventoryCount(index: index, allInventores: self.vendingMachine.readInventores()))개"
        }
    }
    
    @objc func updateBeverageCountLabels() {
        self.configureBeverageCountLabels()
    }
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        guard let moneyIndex: Int = self.addBalanceButtons.firstIndex(of: sender) else { return }
        guard let moneyInputType = self.vendingMachine.tagToMoneyInputType(by: moneyIndex) else { return }
        
        vendingMachine.increaseBalance(moneyInputType.rawValue)
    }
    
    @IBAction func addInventoryButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = self.addInventoryButtons.firstIndex(of: sender) else { return }
        guard let beverageType = self.vendingMachine.tagToBeverageType(by: buttonIndex) else { return }
        guard let beverage = BeverageFactory.produce(of: beverageType) else { return }
        self.vendingMachine.addBeverage(beverage)
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        guard let purchsedIndex: Int = self.purchaseButtons.firstIndex(of: sender) else { return }
        guard let beverageType = self.vendingMachine.tagToBeverageType(by: purchsedIndex) else { return }
        guard let bevergae = BeverageFactory.produce(of: beverageType) else { return }
        vendingMachine.purchaseBeverage(beverage: bevergae)
    }
}

