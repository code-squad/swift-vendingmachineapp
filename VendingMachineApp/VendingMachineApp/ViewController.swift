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
    
    //MARK: Private
    
    private var historyViewInterval: CGFloat = 0
    
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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addHistoryOfPurchaseImageView(_:)),
                                               name: .didChangeHistoryOfPurchase,
                                               object: nil)
        
        updateLabels()
        addHistoryOfPurchaseImageViews()
    }
    
    //MARK: Private
    
    @objc private func updateNumberOfProductLabel(_ noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard let numberOfProduct = userInfo[UserInfoKey.numberOfProduct] as? Int else { return }
        guard let labelToUpdate = userInfo[UserInfoKey.labelToUpdate] as? Int else { return }
        
        numberOfProductLabels[labelToUpdate - 1].text = "\(numberOfProduct)개"
    }
    
    @objc private func updateBalanceLabel(_ noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard let balance = userInfo[UserInfoKey.balance] as? Balance else { return }
        
        let updateBalanceLabel = { [unowned self] (balance: Int) -> Void in
            self.balanceLabel.text = "잔액 : \(balance)원"
        }
        balance.updateBalanceLabel(update: updateBalanceLabel)
    }
    
    @objc private func addHistoryOfPurchaseImageView(_ noti: Notification) {
        
        guard let userInfo = noti.userInfo else { return }
        guard let product = userInfo[UserInfoKey.recentPurchaseProduct] as? Beverage else { return }
        addBeverageImageView(product)
    }
    
    private func updateLabels() {
        
        let updateBalanceLabel: (String) -> Void = { [unowned self] (balance: String) -> Void in
            self.balanceLabel.text = "잔액 : \(balance)원"
        }
        VendingMachine.sharedInstance.updateBalance(update: updateBalanceLabel)
        
        for numberOfProductLabel in numberOfProductLabels {
            let tag = numberOfProductLabel.tag
            guard let beverageType = Mapper.shared.mapping(by: tag) else { return }
            
            let updateNumberOfProductLabel: (Int) -> Void = { (numberOfProduct: Int) -> Void in
                numberOfProductLabel.text = "\(numberOfProduct)개"
            }
            VendingMachine.sharedInstance.updateNumber(of: beverageType, update: updateNumberOfProductLabel)
        }
    }
    
    private func addHistoryOfPurchaseImageViews() {
        
        let addHistoryOfPurchaseImageViews = { [unowned self] (historyOfPurchase: [Beverage]) -> Void in
            for beverage in historyOfPurchase {
                self.addBeverageImageView(beverage)
            }
        }
        VendingMachine.sharedInstance.addHistoryOfPurchaseImageViews(addHistoryOfPurchaseImageViews)
    }
    
    private func addBeverageImageView(_ product: Beverage) {
        
        guard let productImage = UIImage(named: "\(type(of: product)).png") else { return }
        let productImageView = UIImageView(image: productImage)
        productImageView.frame = CGRect(x: 40 + self.historyViewInterval,
                                        y: 575,
                                        width: 140,
                                        height: 100)
        self.historyViewInterval += 50
        productImageView.contentMode = .scaleAspectFit
        
        self.view.addSubview(productImageView)
    }
    
    //MARK: IBAction
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        let tag = sender.tag
        guard let beverageType = Mapper.shared.mapping(by: tag) as? BeverageProduct.Type else { return }
        
        let product = Beverage.produce(product: beverageType)

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
    
    @IBAction func tapBuyBeverageButton(_ sender: UIButton) {
        
        let tag = sender.tag
        guard let productType = Mapper.shared.mapping(by: tag) else { return }
        let _ = VendingMachine.sharedInstance.buy(productType: productType)
    }
}
