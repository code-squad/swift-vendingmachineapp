//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private lazy var vendingMachineInfo = VendingMachineInfo(with: delegate.vendingMachine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInventoryStackView()
        setUpMoneyLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addBeverage), name: NSNotification.Name("addBeverage"), object: nil)
    }
    
    private func setUpInventoryStackView() {
        vendingMachineInfo.repeatForBeverageView { beverageView in
            inventoryStackView.addArrangedSubview(beverageView)
        }
    }
    
    private func setUpMoneyLabel() {
        moneyLabel.text = "잔액: \(delegate.vendingMachine.showCurrentMoney()) 원"
    }
    
    @objc
    private func addBeverage(notification: Notification) {
        
        guard let button = notification.object as? UIButton else {
            return
        }
        guard let beverageType = vendingMachineInfo.beverageTypeButtons[button] else {
            return
        }
        delegate.vendingMachine.appendInventory(beverageType.init())
        
        vendingMachineInfo.beverageStockLabels[button]!.text = "\(delegate.vendingMachine.showAllBeverageList()[ObjectIdentifier(beverageType)]?.count ?? 0)"
    }
    
    
    @IBAction func addMoney5000(_ sender: Any) {
        delegate.vendingMachine.put(in: .fiveThousand)
        setUpMoneyLabel()
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        delegate.vendingMachine.put(in: .thousand)
        setUpMoneyLabel()
    }
}
