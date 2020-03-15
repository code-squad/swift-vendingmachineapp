//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachine: VendingMachine?
    
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockCountLabels: [UILabel]!
    @IBOutlet var beverageImageViews: [UIImageView]!
    @IBOutlet var addMoneyButtons: [UIButton]!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var purchaseButtons: [PurchaseButton]!
    
    let beverageImages: [UIImage] = [#imageLiteral(resourceName: "bananaMilk"), #imageLiteral(resourceName: "ChocoMilk"), #imageLiteral(resourceName: "strawberryMilk"), #imageLiteral(resourceName: "Americano"), #imageLiteral(resourceName: "Latte"), #imageLiteral(resourceName: "Mocha"), #imageLiteral(resourceName: "Coke"), #imageLiteral(resourceName: "Cider"), #imageLiteral(resourceName: "milkis")]
    
    override func viewDidLoad() {
        vendingMachine = appDelegate.vendingMachine
        
        balanceLabel.text = vendingMachine?.balance.description
        updateSavedBeverageCountLabel()
//        updateSavedPurchasedListImages()
        
        super.viewDidLoad()
        setUI()
        setNotificationCenter()
        setPurchaseButtonBeverage()
    }
    
    func setPurchaseButtonBeverage() {
        var index = 0
        for button in purchaseButtons {
            button.beverage = vendingMachine!.products[index]
            index += 1
        }
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(_:)), name: .balanceChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageCountLabel(_:)), name: .updateBeverageCountLabel, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchasedImages(_:)), name: .updatePurchasedImages, object: nil)
    }
    
    func setBeverageImageCornerRadius() {
        for img in beverageImageViews {
            img.layer.cornerRadius = 30.0
        }
    }
    
    func setBackgroundViewCornerRadius() {
        for view in backgroundViews {
            view.layer.cornerRadius = 20.0
        }
    }
    
    func setUI() {
        setBeverageImageCornerRadius()
        setBackgroundViewCornerRadius()
        
    }
    
    @IBAction func addStock(button: UIButton) {
        vendingMachine?.addStock(button.tag)
    }
    
    @IBAction func addMoney(button: UIButton) {
        vendingMachine?.raiseMoney(moneyUnit: Money.MoneyUnit(rawValue: button.tag)!)
    }
    
    @IBAction func purchaseBeverage(button: PurchaseButton) {
        vendingMachine?.purchaseBeverage(button.beverage)
    }
    
    @objc func updatePurchasedImages(_ notification: Notification) {
        guard let beverageIndexes = notification.userInfo?["beverageNSequence"] as? (beverageIndex: Int, purchasedSequence: Int) else { return }
        let purchasedViewIndex = 3
        let downPositionX = (beverageIndexes.purchasedSequence-1) * 50
        
        let image: UIImageView = UIImageView(image: beverageImages[beverageIndexes.beverageIndex])
        image.frame = CGRect(x: downPositionX, y: 30, width: 80, height: 110)
        backgroundViews[purchasedViewIndex].addSubview(image)
    }
    
    @objc func updateBeverageCountLabel(_ notification: Notification) {
        let stockCount = notification.object as! (index: Int, count: Int)
        stockCountLabels[stockCount.index].text = String(stockCount.count)
    }
    
    @objc func updateBalanceLabel(_ notification: Notification) {
        guard let balance = notification.userInfo?["balance"] as? String else { return }
        balanceLabel.text = balance
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .balanceChanged, object: nil)
        NotificationCenter.default.removeObserver(self, name: .updateBeverageCountLabel, object: nil)
        NotificationCenter.default.removeObserver(self, name: .updatePurchasedImages, object: nil)
    }
    
    func updateSavedBeverageCountLabel() {
        let stockCount = vendingMachine?.reportTotalStock()
        for (key, value) in stockCount! {
            if value != 0 {
                guard let index = vendingMachine?.reportProductIndex(key) else { return }
                stockCountLabels[index].text = String(value)
            }
        }
    }
    
//    func updateSavedPurchasedListImages() {
//        guard let purchasedList = vendingMachine?.reportPurchasedHistory() else { return }
//        for purchasedIndex in 0..<purchasedList.count {
//            let purchasedViewIndex = 3
//            let downPositionX = purchasedIndex * 50
//            guard let productIndex = vendingMachine?.reportProductIndex(purchasedList[purchasedIndex]) else { return }
//            let image: UIImageView = UIImageView(image: beverageImages[productIndex])
//            image.frame = CGRect(x: downPositionX, y: 30, width: 80, height: 110)
//            backgroundViews[purchasedViewIndex].addSubview(image)
//        }
//    }
}

extension Notification.Name {
    static let balanceChanged =  NSNotification.Name("balanceChanged")
    static let updateBeverageCountLabel = NSNotification.Name("updateBeverageCountLabel")
    static let updatePurchasedImages = Notification.Name("updatePurchasedImages")
}

