//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private var vendingMachine = VendingMachine(stock: Stock())
    private var beverageObserver: NSObjectProtocol?
    private var balanceObsever: NSObjectProtocol?
    
    deinit {
        removeObservers()
    }
    
    private func removeObservers() {
        guard let beverageDidChangeToken = beverageObserver else { return }
        
        NotificationCenter.default.removeObserver(
            beverageDidChangeToken,
            name: Stock.Notification.beveragesDidChange,
            object: nil
        )
        
        guard let balanceDidChangeToken = balanceObsever else { return }
        
        NotificationCenter.default.removeObserver(
            balanceDidChangeToken,
            name: Cashier.Notification.balanceDidChange,
            object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceLabel.update(currentMoney: vendingMachine.currentMoney())
        configureObservers()
        configureBalanceButtons()
    }
    
    private func configureObservers() {
        beverageObserver = NotificationCenter.default.addObserver(
            forName: Stock.Notification.beveragesDidChange,
            object: nil,
            queue: nil
        ) { [weak self] notifiaction in self?.updateBeverageLabels(notifiaction) }
        
        balanceObsever = NotificationCenter.default.addObserver(
            forName: Cashier.Notification.balanceDidChange,
            object: nil,
            queue: nil
        ) { [weak self] notification in self?.updateBalanceLabel(notification) }
    }
    
    @IBOutlet var beverageNumberLabels: [BeverageLabel]!
    
    @IBAction func beverageButtonDidTouch(_ sender: BeverageButton) {
        guard let berverage = sender.beverage() else { return }
        
        vendingMachine.addToStock(beverage: berverage)
    }
    
    private func updateBeverageLabels(_ notification: Notification) {
        guard let newBeverage = notification.userInfo?["beverage"] as? Beverage else { return }
        
        let stockByKind = vendingMachine.stockByKind()
        for label in beverageNumberLabels {
            guard let beverage = label.beverage(),
                newBeverage == beverage,
                let beverageNumber = stockByKind[beverage] else { continue }
            
            label.update(number: beverageNumber)
            break
        }
    }
    
    @IBOutlet weak var balanceLabel: BalanceLabel!
    @IBOutlet var balanceButtons: [BalanceButton]!
    
    private func configureBalanceButtons() {
        balanceButtons.forEach { configureBalanceAction($0) }
    }
    
    private func configureBalanceAction(_ balanceButton: BalanceButton) {
        balanceButton.action = { [weak self] money in
            guard let money = money else { return }
            
            self?.vendingMachine.receive(insertedMoney: money)
        }
    }
    
    private func updateBalanceLabel(_ notification: Notification) {
        guard let currentMoney = notification.userInfo?["balance"] as? Int else { return }
        
        balanceLabel.update(currentMoney: currentMoney)
    }
}
