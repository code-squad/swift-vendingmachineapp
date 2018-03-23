//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 08/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet var beverageImages: [RoundImageView]!
    @IBOutlet var boughtBeverageButtons: [UIButton]!
    @IBOutlet var addedMoneyButtons: [UIButton]!
    @IBOutlet var beverageQuantityLabels: [UILabel]!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    private var salesHistoryView: SalesHistoryView = SalesHistoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObservers()
    }
    
    private func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoney), name: NSNotification.Name.money, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(recodeSalesHistory), name: NSNotification.Name.salesHistory, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageQuantity), name: NSNotification.Name.inventory, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateMoney()
        updateBeverageQuantity()
        recodeSalesHistory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AdminViewController {
            if let data = self.vendingMachine {
                destination.fillData(data)
            }
        }
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
    
    @objc private func recodeSalesHistory() {
        if let machine = self.vendingMachine {
            var positionNumber = 1
            
            machine.fetchSalesHistory().forEach {
                if positionNumber > salesHistoryView.count {
                    let index = salesHistoryView.makeImageView($0)
                    updateImageView(index)
                }
                
                positionNumber += 1
            }
        }
    }
    
    @objc private func updateBeverageQuantity() {
        var beverageMenu: BeverageMenu = BeverageMenu.bananaMilk
        var quantity: Int = 0
        
        for index in beverageQuantityLabels.indices {
            beverageMenu = BeverageMenu.getBeverageMenu(index: index)
            
            if let machine = self.vendingMachine {
                quantity = machine.countBeverageQuantity(beverageMenu: beverageMenu)
                beverageQuantityLabels[index].text = Formatter.ea(quantity).unit
            }
        }
    }
    
    private func updateImageView(_ position: Int) {
        self.view.addSubview(salesHistoryView[position])
    }

    
    @IBAction func buyBeveragesAction(_ sender: UIButton) {
        let beverageMenu = BeverageMenu.getBeverageMenu(index: sender.tag)
        try? self.vendingMachine?.buyBeverage(beverageMenu: beverageMenu)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
