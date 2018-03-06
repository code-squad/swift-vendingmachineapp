//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

let baseProductsBox = [
    StrawberryMilk(), StrawberryMilk(), StrawberryMilk(),
    BananaMilk(), BananaMilk(), BananaMilk(),
    PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(),
    Fanta(), Fanta(), Fanta(),
    TOPCoffee(), TOPCoffee(), TOPCoffee(),
    Georgia(), Georgia()
]

class ViewController: UIViewController {
    
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var labelOfProducts: [UILabel]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet var addInventory: [UIButton]!
    @IBOutlet var addMoney: [UIButton]!
    
    var vendingMachine : VendingMachine!
    
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vendingMachine = appDelegate.vendingMachine
        balance.text = "\(vendingMachine.getBalance())원"
        updateInventory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

