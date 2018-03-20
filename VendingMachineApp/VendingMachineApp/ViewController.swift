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
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine.sharedInstance()
        changeInventoryBox()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        for index in 0..<9 {
            imageOfMenu[index].layer.cornerRadius = imageOfMenu[index].frame.width/4
            imageOfMenu[index].clipsToBounds = true
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeInventoryBox),
                                               name: NSNotification.Name("changeInventoryBox"),
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
    
    @objc func changeInventoryBox() {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    @IBAction func addBeverage(sender: UIButton) {
        var type = TypeOf.otherBeverage
        for button in addNumberOfMenu where button.tag == sender.tag {
            type = vendingMachine.typeSelector(tag: button.tag)
        }
        alertCountOfBeverage(type: type)
    }
    
    @IBAction func removeAllBeverage(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "vendingMachine")
    }
    
}
