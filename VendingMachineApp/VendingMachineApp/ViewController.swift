//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var numberOfProductLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for productImageView in productImageViews {
            productImageView.layer.cornerRadius = productImageView.frame.height / 2
        }
        
        balanceLabel.text = "잔액 : \(VendingMachine.sharedInstance.readBalance())"
        updateNumberOfProductLabels()
    }

    private func updateNumberOfProductLabels() {
        for numberOfProductLabel in numberOfProductLabels {
            let tag = numberOfProductLabel.superview?.tag ?? 0
            numberOfProductLabel.text = "\(VendingMachine.sharedInstance.number(of: tag))개"
        }
    }
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        guard let tag = sender.superview?.tag else {return}
        
        switch tag {
        case 1:
            add(productType: MandarineMilk.self)
        case 2:
            add(productType: LactoseFreeMilk.self)
        case 3:
            add(productType: StarbucksDoubleShot.self)
        case 4:
            add(productType: TOPTheBlack.self)
        case 5:
            add(productType: CocaCola.self)
        case 6:
            add(productType: CocaColaZero.self)
        default:
            return
        }
        
        updateNumberOfProductLabels()
    }
    
    private func add<T>(productType: T.Type) where T: Beverage, T: Product {
        let beverage = Beverage.produce(product: productType)
        VendingMachine.sharedInstance.add(product: beverage)
    }

    @IBAction func tapInsertMoneyButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            VendingMachine.sharedInstance.insert(money: .thousand)
        case 2:
            VendingMachine.sharedInstance.insert(money: .fiveThousand)
        default:
            return
        }
        
        balanceLabel.text = "잔액 : \(VendingMachine.sharedInstance.readBalance())"
    }
}
