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
    
    private var vendingMachinePublisher: AnyCancellable!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalanceLabel()
        configureInventoryObserver()
        configureSubscriber()
    }
    
    private func configureSubscriber() {
        vendingMachinePublisher = NotificationCenter.default
            .publisher(for: Notification.Name.didChangeMoney)
            .sink { notification in
                DispatchQueue.main.async {
                    self.updateBalanceLabel()
                }
            }
    }
    
    private func configureInventoryObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBeverageCountLabels), name: .didChangeInventory, object: nil)
    }
    
    private func updateBalanceLabel() {
        self.balanceLabel.text = "잔액: \(self.vendingMachine.moneyManager.readBalance()) 원"
    }
    
    func configureBeverageCountLabels() {
        for index in beverageCountLabels.indices {
            self.beverageCountLabels[index].text = "\(self.vendingMachine.inventoryManager.readInventoryCount(index: index, allInventores: self.vendingMachine.inventoryManager.readInventores()))개"
        }
    }
    
    @objc func updateBeverageCountLabels() {
        self.configureBeverageCountLabels()
    }
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        let money: Int = Int(sender.titleLabel?.text ?? "") ?? 0
        vendingMachine.moneyManager.increaseBalance(money)
    }
    
    @IBAction func addInventoryButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = self.addInventoryButtons.firstIndex(of: sender) else { return }
        guard let beverageType = self.vendingMachine.inventoryManager.tagToBeverageType(by: buttonIndex) else { return }
        guard let beverage = BeverageFactory.makeBeverage(beverageType: beverageType) else { return }
        self.vendingMachine.inventoryManager.addBeverage(beverage)
    }
}

