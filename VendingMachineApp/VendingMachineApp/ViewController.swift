//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private var vendingMachine = VendingMachine(stock: Stock(), balance: Money())
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
            name: Money.Notification.balanceDidChange,
            object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceLabel.update(currentMoney: vendingMachine.money)
        configureObservers()
    }
    
    private func configureObservers() {
        beverageObserver = NotificationCenter.default.addObserver(
            forName: Stock.Notification.beveragesDidChange,
            object: nil,
            queue: nil
        ) { [weak self] notifiaction in self?.updateBeverageLabels(notifiaction) }
        
        balanceObsever = NotificationCenter.default.addObserver(
            forName: Money.Notification.balanceDidChange,
            object: nil,
            queue: nil
        ) { [weak self] _ in self?.updateBalanceLabel() }
    }
    
    @IBOutlet var beverageNumberLabels: [BeverageLabel]!
    
    @IBAction func beverageButtonDidTouch(_ sender: BeverageButton) {
        guard let berverage = sender.instantiator()?.beverage else { return }
        
        vendingMachine.addToStock(beverage: berverage)
    }
    
    private func updateBeverageLabels(_ notification: Notification) {
        guard let newBeverage = notification.userInfo?["beverage"] as? Beverage else { return }
        
        for label in beverageNumberLabels {
            guard let beverage = label.instantiator()?.beverage,
                newBeverage == beverage else { continue }
            
            label.update(number: vendingMachine.count(of: beverage))
            break
        }
    }
    
    @IBOutlet weak var balanceLabel: BalanceLabel!
    @IBAction func balanceButtonDidTouch(_ sender: MoneyButton) {
        guard let money = sender.instantiator?.money else { return }
        
        vendingMachine.receive(insertedMoney: money)
    }
    
    private func updateBalanceLabel() {
        balanceLabel.update(currentMoney: vendingMachine.money)
    }
}
