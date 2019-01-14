//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    //MARK: IBOutlet
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var numberOfProductLabels: [UILabel]!
    
    //MARK: - Methods
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for productImageView in productImageViews {
            productImageView.layer.cornerRadius = productImageView.frame.height / 2
        }
        updateLabels()
    }
    
    //MARK: Private
    
    private func updateLabels() {
        
        let updateBalanceLabel: (String) -> Void = { (balance: String) -> Void in
            self.balanceLabel.text = "잔액 : \(balance)"
        }
        VendingMachine.sharedInstance.updateBalance(update: updateBalanceLabel)
        
        for numberOfProductLabel in numberOfProductLabels {
            let tag = numberOfProductLabel.superview?.tag ?? 0
            let updateNumberOfProductLabel: (Int) -> Void = { (numberOfProduct: Int) -> Void in
                numberOfProductLabel.text = "\(numberOfProduct)개"
            }
            VendingMachine.sharedInstance.updateNumber(of: tag, update: updateNumberOfProductLabel)
        }
    }
    
    private func add<T>(productType: T.Type) where T: Beverage, T: Product {
        let beverage = Beverage.produce(product: productType)
        VendingMachine.sharedInstance.add(product: beverage)
    }
    
    //MARK: IBAction
    
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
        
        self.updateLabels()
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
        
        updateLabels()
    }
}
