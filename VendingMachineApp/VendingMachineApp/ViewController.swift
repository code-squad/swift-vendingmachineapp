//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine: VendingMachine = VendingMachine()
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var numberOfProductLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for productImageView in productImageViews {
            productImageView.layer.cornerRadius = productImageView.frame.height / 2
        }
        balanceLabel.text = "잔액 : \(vendingMachine.readBalance())"
        updateNumberOfProductLabels()
    }

    private func updateNumberOfProductLabels() {
        let numberOfProducts = vendingMachine.inventory()
        for numberOfProductLabel in numberOfProductLabels {
            guard let id = numberOfProductLabel.restorationIdentifier else {continue}
            guard let numberOfProduct = numberOfProducts[id] else {
                numberOfProductLabel.text = "0개"
                continue
            }
            numberOfProductLabel.text = "\(numberOfProduct)개"
        }
    }
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        let beverage: Beverage
        
        switch sender.restorationIdentifier {
        case "mandarineMilkAddButton":
            beverage = Beverage.produce(product: MandarineMilk.self)
        case "lactoseFreeMilkAddButton":
            beverage = Beverage.produce(product: LactoseFreeMilk.self)
        case "starbucksDoubleShotAddButton":
            beverage = Beverage.produce(product: StarbucksDoubleShot.self)
        case "topTheBlackAddButton":
            beverage = Beverage.produce(product: TOPTheBlack.self)
        case "cocaColaAddButton":
            beverage = Beverage.produce(product: CocaCola.self)
        case "cocaColaZeroAddButton":
            beverage = Beverage.produce(product: CocaColaZero.self)
        default:
            return
        }
        vendingMachine.add(product: beverage)
        updateNumberOfProductLabels()
    }

    @IBAction func tapInsertMoneyButton(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "1000Won":
            vendingMachine.insert(money: 1000)
        case "5000Won":
            vendingMachine.insert(money: 5000)
        default:
            return
        }
        balanceLabel.text = "잔액 : \(vendingMachine.readBalance())"
    }
}

