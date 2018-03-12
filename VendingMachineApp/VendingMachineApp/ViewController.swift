//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine : VendingMachine!
    
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var labelOfProducts: [UILabel]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet var addInventory: [UIButton]!
    @IBOutlet var addMoney: [UIButton]!
    
    @IBAction func addInventoryButtonTouched(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "firstProduct"? : vendingMachine.addBeverage(StrawberryMilk())
        case "secondProduct"?: vendingMachine.addBeverage(BananaMilk())
        case "thirdProduct"?: vendingMachine.addBeverage(PepciCoke())
        case "fourthProduct"?: vendingMachine.addBeverage(Fanta())
        case "fifthProduct"?: vendingMachine.addBeverage(TOPCoffee())
        case "sixthProduct"?: vendingMachine.addBeverage(Georgia())
        default:
            return
        }
    }
    
    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0: vendingMachine.addMoney(.oneThousand)
        case 1: vendingMachine.addMoney(.fiveThousands)
        default:
            return
        }
    }
    
    @objc private func updateInventoryLabels(notification : Notification) {
        guard let userInfo = notification.userInfo as? [String : Inventory] else { return }
        guard let inventory = userInfo[Keyword.UserInfo.inventory.rawValue] else { return }
        updateInventory(inventory.generateCountOfProduct())
    }
    
    @objc private func updateBalanceLabel(notification : Notification) {
        guard let userInfo = notification.userInfo as? [String : Int] else { return }
        guard let insertedMoney = userInfo[Keyword.UserInfo.balance.rawValue] else { return }
        updateBalance(insertedMoney)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.shared()
        
        updateBalance(vendingMachine.getBalance())
        updateInventory(vendingMachine.generateCountOfProduct())
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateInventoryLabels(notification:)), name: .didUpdateInventory , object: VendingMachine.shared())
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(notification:)), name: .didUpdateBalance , object: VendingMachine.shared())
    }
    
    private func updateBalance(_ insertedMoney : Int) {
        balance.text = "\(insertedMoney)원"
    }
    
    private func updateInventory(_ countOfProducts : [Int]) {
        var inventoryIndex = 0
        for countOfOneProduct in countOfProducts {
            labelOfProducts[inventoryIndex].text = "\(countOfOneProduct)개"
            inventoryIndex += 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

