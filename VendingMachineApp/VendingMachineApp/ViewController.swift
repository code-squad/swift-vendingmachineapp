//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vendingMachineStackView: UIStackView!
    @IBOutlet weak var productsStackView: UIStackView!
    @IBOutlet weak var controllerStackView: UIStackView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet var beverageViews: [UIView]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    private let vendingMachine = VendingMachine(cashier: Cashier())
    private let observers = Observers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutStackViews()
        layoutBeverageViews()
        setupBeverageLabels()
        
        addViewUpdatingObservers()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    @IBAction func insertMoney(_ sender: UIButton) {
        if let money = ViewIdentifier.findBalanceButton(by: sender.tag)?.money {
            vendingMachine.insert(money: money)
        }
    }
    
    @IBAction func addBeverage(_ sender: UIButton) {
        if let id = ViewIdentifier.findBeverageButton(by: sender.tag) {
            vendingMachine.fill(beverage: BeverageFactory.make(by: id))
        }
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: .balanceDidChange) { [weak self] in
            guard let cashier = $0 as? Cashier else { return }
            self?.balanceLabel.text = "잔액: \(cashier.balance())원"
        }
        
        observers.addObserver(forName: .inventoryDidChange) { [weak self] in
            guard let inventory = $0 as? Inventory else { return }
            let stock = inventory.briefStock()
            
            self?.beverageLabels.forEach { label in
                guard let type = ViewIdentifier.findLabel(by: label.tag)?.type else { return }
                label.text = "\(stock[type] ?? 0)"
            }
        }
    }
}

extension ViewController {
    private func layoutStackViews() {
        let readableGuide = view.readableContentGuide
        productsStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        productsStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
        controllerStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        controllerStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
    }
    
    private func layoutBeverageViews() {
        beverageViews.forEach { $0.layer.cornerRadius = 30 }
    }
    
    private func setupBeverageLabels() {
        beverageLabels.forEach { $0.text = "0" }
    }
}
