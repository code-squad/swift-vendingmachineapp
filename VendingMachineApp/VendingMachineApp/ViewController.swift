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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateNumberOfProductLabel(_:)), name: Notification.Name.didChangeNumberOfProduct, object: nil)
    }
    
    //MARK: Private
    
    private func updateLabels() {
        
        let updateBalanceLabel: (String) -> Void = { [unowned self] (balance: String) -> Void in
            self.balanceLabel.text = "잔액 : \(balance)"
        }
        VendingMachine.sharedInstance.updateBalance(update: updateBalanceLabel)
        
        for numberOfProductLabel in numberOfProductLabels {
            let tag = numberOfProductLabel.superview?.tag ?? 0
            guard let beverageType = Mapper.map[tag] else { return }
            
            let updateNumberOfProductLabel: (Int) -> Void = { (numberOfProduct: Int) -> Void in
                numberOfProductLabel.text = "\(numberOfProduct)개"
            }
            VendingMachine.sharedInstance.updateNumber(of: beverageType, update: updateNumberOfProductLabel)
        }
    }
    
    @objc private func updateNumberOfProductLabel(_ noti: Notification) {
        
    }
    
    //MARK: IBAction
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        guard let tag = sender.superview?.tag else { return }
        guard let beverageType = Mapper.map[tag] else { return }
        
        let product = Beverage.produce(product: beverageType)
        
        VendingMachine.sharedInstance.add(product: product)
        
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
