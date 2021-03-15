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
    
    private func configureBeverageCountLabels() {
        for index in beverageCountLabels.indices {
            self.beverageCountLabels[index].text = "\(self.vendingMachine.readInventoryCount(index: index))개"
        }
    }
    
    @objc func updateBeverageCountLabels() {
        self.configureBeverageCountLabels()
    }
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        guard let index: Int = self.addBalanceButtons.firstIndex(of: sender) else { return }
        guard let moneyInputType = self.vendingMachine.mappingIndexToMoneyInput(by: index) else { return }
        
        vendingMachine.increaseBalance(moneyInputType.rawValue)
    }
    
    @IBAction func addInventoryButtonTapped(_ sender: UIButton) {
        guard let index: Int = self.addInventoryButtons.firstIndex(of: sender) else { return }
        guard let beverageType = self.vendingMachine.mappingIndexToBeverageType(by: index) else { return }
        self.vendingMachine.addBeverage(beverageType)
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        guard let index: Int = self.purchaseButtons.firstIndex(of: sender) else { return }
        guard let beverageType = self.vendingMachine.mappingIndexToBeverageType(by: index) else { return }
        self.vendingMachine.purchaseBeverage(beverageType: beverageType)
        configureCollectionView()
    }
}
