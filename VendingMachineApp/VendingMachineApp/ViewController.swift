//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 8..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: Vending!
    typealias TypeOf = InventoryBox.InventoryMenu
    private var imageX = 0

    @IBOutlet var countOfMenu: [UILabel]!
    @IBOutlet var imageOfMenu: [RoundImageView]!
    @IBOutlet var purchaseOfMenu: [UIButton]!
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.sharedInstance()
        changeInventoryBox()
        changeCoin()
        registerObserver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func printPurchaseProductImage() {
        for products in vendingMachine.showPurchaseProductHistory() {
            addPurchaseImage(beverage: products.purchaseBeverage)
        }
    }
    
    func registerObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeInventoryBox),
                                               name: Notification.Name.DidResetInventoryBox,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePurchaseHistory),
                                               name: Notification.Name.DidResetPurchaseHistory,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeCoin),
                                               name: Notification.Name.DidResetBalance,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(purchaseFailure),
                                               name: Notification.Name.DidPurchaseFailure,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(haveNoCoin),
                                               name: Notification.Name.NoCoin,
                                               object: nil)
    }
    
    func addPurchaseProductHistory(type: TypeOf) {
        let beverageName = self.vendingMachine.choiceBeverageData(menuType: type)
        self.vendingMachine.buyBeverage(beverageName: beverageName)
    }
    
    func addPurchaseImage(beverage: Beverage) {
        let imageName = String(describing: beverage.bringImageName)
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        let imageView = ImageViewMaker.makeImageView(imageX: imageX)
        imageView.image = image
        self.view.addSubview(imageView)
        self.imageX += 50
    }
    
    @objc func haveNoCoin() {
        let title = "구매 실패"
        let message = "코인을 충전해주세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) {(_) in }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @objc func purchaseFailure() {
        let title = "구매 실패"
        let message = "음료를 구매 할 수 없습니다."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) {(_) in }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @objc func changePurchaseHistory(_ notification: Notification) {
        guard let data = notification.userInfo as? [String: Beverage] else {
            return
        }
        guard let beverage = data["purchasedBeverage"] else {
            return
        }
        addPurchaseImage(beverage: beverage)
    }
    
    @objc func changeCoin() {
        balance.text = String(vendingMachine.checkBalance())
    }
    
    @objc func changeInventoryBox() {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    
    @IBAction func purchaseBeverage(sender: UIButton) {
        var type = TypeOf.otherBeverage
        for button in purchaseOfMenu where button.tag == sender.tag {
            type = vendingMachine.typeSelector(tag: button.tag)
        }
        addPurchaseProductHistory(type: type)
    }
    
    @IBAction func addBalance(_ button: UIButton) {
        self.vendingMachine.putCoins(coins: button.tag)
    }
}
