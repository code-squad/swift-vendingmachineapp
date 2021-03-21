//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var purchasedBeverageScrollView: UIScrollView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var vendingMachine: VendingMachine!
    
    private lazy var vendingMachineInfo = VendingMachineInfo(with: vendingMachine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInventoryStackView()

        NotificationCenter.default.addObserver(self, selector: #selector(addBeverage), name: NSNotification.Name("didTapBeverageButton"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStockLabel), name: NSNotification.Name("addedBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoneyLabel), name: NSNotification.Name("addMoney"), object: vendingMachine)
    }
    
    private func setUpInventoryStackView() {
        vendingMachineInfo.repeatForBeverageView { beverageView in
            inventoryStackView.addArrangedSubview(beverageView)
        }
    }
    
    @objc
    private func updateMoneyLabel(notification: Notification) {
        let vendingMachine = notification.object as! VendingMachine
      
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
    
    @objc
    private func addBeverage(notification: Notification) {
        
        guard let button = notification.object as? UIButton,
              let beverageType = vendingMachineInfo.beverageTypeButtons[button] else {
            return
        }

        vendingMachine.appendInventory(beverageType.init())
    }
    
    @objc
    private func updateBeverageStockLabel(notification: Notification) {

        guard let beverageType = notification.userInfo as? [ObjectIdentifier:[Beverage]] else {
            return
        }
        beverageType.keys.forEach { objectIdentifier in
            vendingMachineInfo.matchModelAndViewHelper[objectIdentifier]?.stockLabel.text = "\(beverageType[objectIdentifier]?.count ?? 0)"
        }
    }
    
    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
    }
}
