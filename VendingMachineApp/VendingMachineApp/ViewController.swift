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
    private var tag = 0
    
    //MARK: - Methods
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateNumberOfProductLabel(_:)),
                                               name: .didChangeNumberOfProduct,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateBalanceLabel(_:)),
                                               name: .didChangeBalance,
                                               object: nil)
        
        updateLabels()
    }
    
    //MARK: Private
    
    @objc private func updateNumberOfProductLabel(_ noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard let numberOfProduct = userInfo[UserInfoKey.numberOfProduct] as? Int else { return }
        let numberOfProductLabel = self.numberOfProductLabels.filter() { $0.tag == self.tag }
        numberOfProductLabel.first?.text = "\(numberOfProduct)개"
    }
    
    @objc private func updateBalanceLabel(_ noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard let balance = userInfo[UserInfoKey.balance] as? Int else { return }
        self.balanceLabel.text = "잔액 : \(balance)원"
    }
    
    private func updateLabels() {
        
        let updateBalanceLabel: (String) -> Void = { [unowned self] (balance: String) -> Void in
            self.balanceLabel.text = "잔액 : \(balance)원"
        }
        VendingMachine.sharedInstance.updateBalance(update: updateBalanceLabel)
        
        for numberOfProductLabel in numberOfProductLabels {
            let tag = numberOfProductLabel.tag
            guard let beverageType = Mapper.map[tag] else { return }
            
            let updateNumberOfProductLabel: (Int) -> Void = { (numberOfProduct: Int) -> Void in
                numberOfProductLabel.text = "\(numberOfProduct)개"
            }
            VendingMachine.sharedInstance.updateNumber(of: beverageType, update: updateNumberOfProductLabel)
        }
    }
    
    //MARK: IBAction
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        let tag = sender.tag
        guard let beverageType = Mapper.map[tag] else { return }
        
        let product = Beverage.produce(product: beverageType)
        self.tag = tag
        VendingMachine.sharedInstance.add(product: product)
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
    }
}
