//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var labelOfProducts: [UILabel]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet var addInventory: [UIButton]!
    @IBOutlet var addMoney: [UIButton]!
    
    @IBAction func addInventoryButtonTouched(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "firstProduct"? : VendingMachine.shared().addBeverage(StrawberryMilk())
        case "secondProduct"?: VendingMachine.shared().addBeverage(BananaMilk())
        case "thirdProduct"?: VendingMachine.shared().addBeverage(PepciCoke())
        case "fourthProduct"?: VendingMachine.shared().addBeverage(Fanta())
        case "fifthProduct"?: VendingMachine.shared().addBeverage(TOPCoffee())
        case "sixthProduct"?: VendingMachine.shared().addBeverage(Georgia())
        default:
            return
        }
    }
    
    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0: VendingMachine.shared().addMoney(.oneThousand)
        case 1: VendingMachine.shared().addMoney(.fiveThousands)
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
        
        updateBalance(VendingMachine.shared().getBalance())
        updateInventory(VendingMachine.shared().generateCountOfProduct())
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateInventoryLabels(notification:)), name: .didUpdateInventory , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(notification:)), name: .didUpdateBalance , object: nil)
    }
    
    private func updateBalance(_ insertedMoney : Int) {
        balance.text = insertedMoney.formatMoney()
    }
    
    private func updateInventory(_ countOfProducts : [Int]) {
        var inventoryIndex = 0
        for countOfOneProduct in countOfProducts {
            labelOfProducts[inventoryIndex].text = countOfOneProduct.formatCount()
            inventoryIndex += 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension Int {
    func formatCount() -> String {
        return String(format : "%2d개", self)
    }
    
    func formatMoney() -> String {
        return String(format : "%6d원", self)
    }
}

