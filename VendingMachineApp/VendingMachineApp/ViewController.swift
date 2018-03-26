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
    private var inventoryBox = InventoryBox()
    typealias TypeOf = InventoryBox.InventoryMenu
    private var imageX = 0

    @IBOutlet var countOfMenu: [UILabel]!
    @IBOutlet var imageOfMenu: [RoundImageView]!
    @IBOutlet var addNumberOfMenu: [UIButton]!
    @IBOutlet var purchaseOfMenu: [UIButton]!
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.sharedInstance()
        changeInventoryBox()
        changeCoin()
        for products in vendingMachine.showPurchaseProductHistory() {
            printPurchaseProducts(beverage: products.purchaseBeverage)
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func alertCountOfBeverage(type: TypeOf) {
        let title = "추가"
        let message = "추가 할 재고 갯수를 입력하세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) {(_) in
            if let inputValue = alert.textFields?[0] {
                guard let numberOf = Int(inputValue.text ?? "0") else {
                    return
                }
                let beverageName = self.vendingMachine.choiceBeverageData(menuType: type)
                self.vendingMachine.addInInventory(beverageName: beverageName, number: numberOf)
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(text) in
            text.placeholder = "갯수입력"
        })
        self.present(alert, animated: true)
    }
    
    func addPurchaseProductHistory(type: TypeOf) {
        let beverageName = self.vendingMachine.choiceBeverageData(menuType: type)
        self.vendingMachine.buyBeverage(beverageName: beverageName)
    }
    
    func printPurchaseProducts(beverage: Beverage) {
        let imageName = String(describing: beverage.bringImageName)
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        let imageView = ImageViewMaker.makeImageView(imageX: imageX)
        imageView.image = image
        self.view.addSubview(imageView)
        self.imageX += 50
    }
    
    @objc func purchaseFailure() {
        let title = "구매 실패"
        let message = "음료를 구매 할 수 없습니다."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) {(_) in }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @objc func changeInventoryBox() {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    @objc func changePurchaseHistory(_ notification: Notification) {
        changeInventoryBox()
        guard let data = notification.userInfo as? [String: Beverage] else {
            return
        }
        guard let beverage = data["purchasedBeverage"] else {
            return
        }
        printPurchaseProducts(beverage: beverage)
    }
    
    @objc func changeCoin() {
        balance.text = String(vendingMachine.checkBalance())
    }
    
    @IBAction func addBeverage(sender: UIButton) {
        var type = TypeOf.otherBeverage
        for button in addNumberOfMenu where button.tag == sender.tag {
            type = vendingMachine.typeSelector(tag: button.tag)
        }
        alertCountOfBeverage(type: type)
    }
    
    @IBAction func purchaseBeverage(sender: UIButton) {
        var type = TypeOf.otherBeverage
        for button in purchaseOfMenu where button.tag == sender.tag {
            type = vendingMachine.typeSelector(tag: button.tag)
        }
        addPurchaseProductHistory(type: type)
    }
    
    @IBAction func removeAllBeverage(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "vendingMachine")
    }
    
    @IBAction func addBalance(_ button: UIButton) {
        self.vendingMachine.putCoins(coins: button.tag)
        changeCoin()
    }
}
