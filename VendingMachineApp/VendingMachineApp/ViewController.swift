//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 08/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var addedBeverageButtons: [UIButton]!
    @IBOutlet var beverageQuantityLabels: [UILabel]!
    @IBOutlet var addedMoneyButtons: [UIButton]!
    @IBOutlet weak var moneyLabel: UILabel!
    var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoundedImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateMoney()
        
        for index in 0..<beverageQuantityLabels.count {
            updateBeverageQuantity(index: index)
        }
    }
    
    private func setRoundedImages() {
        beverageImages.forEach({
            $0.layer.cornerRadius = 50.0
            $0.layer.masksToBounds = true
            $0.backgroundColor = UIColor.white
        })
    }
    
    @IBAction func insertMoneyAction(_ sender: UIButton) {
        let money = Money(sender.tag)
        try? self.vendingMachine?.insertMoney(coin: money)
        
        updateMoney()
    }
    
    private func updateMoney() {
        if let machine = self.vendingMachine {
            moneyLabel.text = "\(machine.countChange()) 원"
        }
    }
    
    @IBAction func insertBeverageAction(_ sender: UIButton) {
        let beverageMenu = matchBeverageMenu(index: sender.tag)
        
        self.vendingMachine?.insertBeverage(beverageMenu: beverageMenu, quantity: 1)
        updateBeverageQuantity(index: sender.tag)
    }
    
    private func updateBeverageQuantity(index: Int) {
        let beverageMenu = matchBeverageMenu(index: index)
        let quantity = self.vendingMachine?.countBeverageQuantity(beverageMenu: beverageMenu) ?? 0
        
        beverageQuantityLabels[index].text = "\(quantity) 개"
    }
    
    private func matchBeverageMenu(index: Int) -> BeverageMenu {
        return BeverageMenu.getBeverageMenu(index: index)
    }
}

