//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 8..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine: Vending!
    var inventoryBox = InventoryBox()
    typealias TypeOf = InventoryBox.InventoryMenu

    @IBOutlet var countOfMenu: [UILabel]!
    @IBOutlet var imageOfMenu: [UIImageView]!
    @IBOutlet var addNumberOfMenu: [UIButton]!
    @IBOutlet var purchaseOfMenu: [UIButton]!
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.sharedInstance()
        changeInventoryBox()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        for index in 0..<9 {
            imageOfMenu[index].layer.cornerRadius = imageOfMenu[index].frame.width/4
            imageOfMenu[index].layer.borderWidth = 5
            imageOfMenu[index].clipsToBounds = true
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeInventoryBox),
                                               name: Notification.Name.DidResetInventoryBox,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePurchaseHistory),
                                               name: Notification.Name.DidResetPurchaseHistory,
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
                guard let vending = self.vendingMachine as? VendingMachine else {
                    return
                }
                VendingMachine.storedInstance(vending)
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(text) in
            text.placeholder = "갯수입력"
        })
        self.present(alert, animated: true)
    }
    
    func printPurchaseImage(type: TypeOf) {
        let beverageName = self.vendingMachine.choiceBeverageData(menuType: type)
        self.vendingMachine.buyBeverage(beverageName: beverageName)
    }
    
    @objc func changeInventoryBox() {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    @objc func changePurchaseHistory(_ notification: Notification) {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
        guard let data = notification.userInfo as? [String:Beverage] else {
            return
        }
        guard let beverage = data["purchasedBeverage"] else {
            return
        }
        
        // 이미지 선택 및 위치 설정
        let image = UIImage(named: beverage)
        let imageView = UIImageView(frame: CGRect(x: 40, y: 575, width: 140, height: 100))
        imageView.image = image
        self.view.addSubview(imageView)
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
        printPurchaseImage(type: type)
    }
    
    @IBAction func removeAllBeverage(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "vendingMachine")
    }
    
}
