//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 08/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var beverageImages: [RoundImageView]!
    @IBOutlet var addedBeverageButtons: [UIButton]!
    @IBOutlet var boughtBeverageButtons: [UIButton]!
    @IBOutlet var beverageQuantityLabels: [UILabel]!
    @IBOutlet var addedMoneyButtons: [UIButton]!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    private var salesHistoryView: SalesHistoryView = SalesHistoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObservers()
    }
    
    private func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoney), name: NSNotification.Name.money, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageQuantity), name: NSNotification.Name.inventory, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(recodeSalesHistory), name: NSNotification.Name.salesHistory, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateMoney()
        updateBeverageQuantity()
        recodeSalesHistory()
    }
    
    @IBAction func insertMoneyAction(_ sender: UIButton) {
        let money = Money(sender.tag)
        try? self.vendingMachine?.insertMoney(coin: money)
    }
    
    @objc private func updateMoney() {
        if let machine = self.vendingMachine {
            moneyLabel.text = Formatter.won(machine.countChange()).unit
        }
    }
    
    @IBAction func insertBeverageAction(_ sender: UIButton) {
        let beverageMenu = matchBeverageMenu(index: sender.tag)
        self.vendingMachine?.insertBeverage(beverageMenu: beverageMenu, quantity: 1)
    }
    
    @objc private func updateBeverageQuantity() {
        var beverageMenu: BeverageMenu = BeverageMenu.bananaMilk
        var quantity: Int = 0
        
        for index in beverageQuantityLabels.indices {
            beverageMenu = matchBeverageMenu(index: index)
            
            if let machine = self.vendingMachine {
                quantity = machine.countBeverageQuantity(beverageMenu: beverageMenu)
                beverageQuantityLabels[index].text = Formatter.ea(quantity).unit
            }
        }
    }
    
    private func matchBeverageMenu(index: Int) -> BeverageMenu {
        return BeverageMenu.getBeverageMenu(index: index)
    }
    
    @objc private func recodeSalesHistory() {
        if let machine = self.vendingMachine {
            var positionNumber = 1
            
            machine.fetchSalesHistory().forEach {
                if positionNumber > salesHistoryView.count {
                    salesHistoryView.makeImageView($0)
                    updateImageView(positionNumber)
                }
                
                positionNumber += 1
            }
        }
    }
    
    private func updateImageView(_ position: Int) {
        self.view.addSubview(salesHistoryView[position-1])
    }

    
    @IBAction func buyBeveragesAction(_ sender: UIButton) {
        let beverageMenu = matchBeverageMenu(index: sender.tag)
        try? self.vendingMachine?.buyBeverage(beverageMenu: beverageMenu)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
