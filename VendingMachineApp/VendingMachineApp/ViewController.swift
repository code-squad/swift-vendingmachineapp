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
        guard let tag = sender.superview?.tag else {return}
        
        switch tag {
        case 1:
            beverage = Beverage.produce(product: MandarineMilk.self)
        case 2:
            beverage = Beverage.produce(product: LactoseFreeMilk.self)
        case 3:
            beverage = Beverage.produce(product: StarbucksDoubleShot.self)
        case 4:
            beverage = Beverage.produce(product: TOPTheBlack.self)
        case 5:
            beverage = Beverage.produce(product: CocaCola.self)
        case 6:
            beverage = Beverage.produce(product: CocaColaZero.self)
        default:
            return
        }
        
        vendingMachine.add(product: beverage)
        updateNumberOfProductLabels()
    }

    @IBAction func tapInsertMoneyButton(_ sender: UIButton) {
        let money = sender.tag
        vendingMachine.insert(money: money)
        balanceLabel.text = "잔액 : \(vendingMachine.readBalance())"
    }
}

