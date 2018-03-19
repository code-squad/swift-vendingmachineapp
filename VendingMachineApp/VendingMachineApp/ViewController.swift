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
    @IBOutlet var beverageQuantityLabels: [UILabel]!
    @IBOutlet var addedMoneyButtons: [UIButton]!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoney), name: NSNotification.Name.money, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageQuantity), name: NSNotification.Name.inventory, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateMoney()
        updateBeverageQuantity()
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
        
        for index in 0..<beverageQuantityLabels.count {
            beverageMenu = matchBeverageMenu(index: index)
            quantity = self.vendingMachine?.countBeverageQuantity(beverageMenu: beverageMenu) ?? 0
            beverageQuantityLabels[index].text = Formatter.ea(quantity).unit
        }
    }
    
    private func matchBeverageMenu(index: Int) -> BeverageMenu {
        return BeverageMenu.getBeverageMenu(index: index)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

