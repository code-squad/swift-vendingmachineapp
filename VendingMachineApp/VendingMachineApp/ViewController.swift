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
        for numberOfProductLabel in numberOfProductLabels {
            guard let tag = numberOfProductLabel.superview?.tag else {continue}
            let numberOfProduct = vendingMachine.numberOf(tag: tag)
            numberOfProductLabel.text = "\(numberOfProduct)개"
        }
    }
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        guard let tag = sender.superview?.tag else {return}
        
        switch tag {
        case 1:
            addBeverage(of: MandarineMilk.self)
        case 2:
            addBeverage(of: LactoseFreeMilk.self)
        case 3:
            addBeverage(of: StarbucksDoubleShot.self)
        case 4:
            addBeverage(of: TOPTheBlack.self)
        case 5:
            addBeverage(of: CocaCola.self)
        case 6:
            addBeverage(of: CocaColaZero.self)
        default:
            return
        }

        updateNumberOfProductLabels()
    }
    
    private func addBeverage<T>(of Type: T.Type) where T: Beverage, T: Product {
        let beverage = Beverage.produce(product: Type)
        vendingMachine.add(product: beverage)
    }

    @IBAction func tapInsertMoneyButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            vendingMachine.insert(money: .thousand)
        case 2:
            vendingMachine.insert(money: .fiveThousand)
        default:
            return
        }
        
        balanceLabel.text = "잔액 : \(vendingMachine.readBalance())"
    }
}

