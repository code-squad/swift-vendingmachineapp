//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet var beverageImageViews: [UIImageView]!
    @IBOutlet var addInventoryButtons: [UIButton]!
    @IBOutlet var beverageNameLabels: [UILabel]!
    @IBOutlet var addBalanceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    private var vendingMachinePublisher: AnyCancellable!
    private let vendingMachine = VendingMachine(moneyManager: Money(), inventoryManager: Inventory(), purchaseHistoryManager: PurchaseHistory())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubscriber()
        print(vendingMachine.inventoryManager.readInventores())
    }
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        let money: Int = Int(sender.titleLabel?.text ?? "") ?? 0
        vendingMachine.moneyManager.increaseBalance(money)
    }
    
    private func configureSubscriber() {
        vendingMachinePublisher = NotificationCenter.default
            .publisher(for: Money.Notification.DidChangeBalance)
            .sink { notification in
                DispatchQueue.main.async {
                    self.balanceLabel.text = "잔액: \(self.vendingMachine.moneyManager.readBalance())원"
                }
            }
    }
}

