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
    @IBOutlet var beverageLabels: [BeverageLabel]!
    @IBOutlet var beverageButtons: [BeverageButton]!
    @IBOutlet var balanceButtons: [BalanceButton]!
    
    private let vendingMachine = VendingMachine(cashier: Cashier())
    private let observers = Observers()
    
    private let moneyToAdd: Dictionary<BalanceButton.Item, Int> = [
        .thousand: 1000,
        .fiveThousand: 5000
    ]
    
    private let beverageToUpdate: Dictionary<BeverageLabel.Item, Beverage> = [
        .coke: Coke(),
        .fanta: Fanta(),
        .strawberryMilk: StrawberryMilk(),
        .chocolateMilk: ChocolateMilk(),
        .georgia: Georgia(),
        .top: Top()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutStackViews()
        layoutBeverageViews()
        layoutBeverageLabels()
        
        setupActionsForButtons()
        addViewUpdatingObservers()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func setupActionsForButtons() {
        beverageButtons.forEach { button in
            button.customAction = { [weak self] in self?.vendingMachine.fill(beverage: $0) }
        }
        
        balanceButtons.forEach { button in
            button.action = { [weak self] in
                guard let money = self?.moneyToAdd[$0] else { return }
                self?.vendingMachine.insert(money: money)
            }
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
                guard let type = label.beverageType,
                    let beverageType = self?.beverageToUpdate[type] else { return }
                label.update(value: stock[beverageType])
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
    
    private func layoutBeverageLabels() {
        beverageLabels.forEach { $0.text = "0" }
    }
}
