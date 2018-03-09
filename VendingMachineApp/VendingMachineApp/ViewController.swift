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
        updateInventory()
    }
    
    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0: vendingMachine.addMoney(.oneThousand)
        case 1: vendingMachine.addMoney(.fiveThousands)
        default:
            return
        }
        balance.text = "\(vendingMachine.getBalance())원"
    }
    
    private func updateInventory() {
        var inventoryIndex = 0
        for oneProductName in vendingMachine.generateProductNamesInNumber() {
            labelOfProducts[inventoryIndex].text = "\(self.vendingMachine.generateCountOfProduct(oneProductName))개"
            inventoryIndex += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.shared()
        balance.text = "\(vendingMachine.getBalance())원"
        updateInventory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

