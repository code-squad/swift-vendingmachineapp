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

        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStockLabel), name: NSNotification.Name("addedBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoneyLabel), name: NSNotification.Name("addMoney"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStockLabel), name: NSNotification.Name("buyBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoneyLabel), name: NSNotification.Name("buyBeverage"), object: vendingMachine)
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
    
    //BeverageView - addButton의 First Responder로 설정
    @IBAction
    func addBeverage(_ sender: UIButton) {
        
        guard let beverageType = vendingMachineInfo.beverageTypeAddButtons[sender] else {
            return
        }

        vendingMachine.appendInventory(beverageType.init())
    }
    
    //BeverageView - buyButton의 First Responder로 설정
    @IBAction
    func buyBeverage(_ sender: UIButton) {
        
        guard let beverageType = vendingMachineInfo.beverageTypeBuyButtons[sender] else {
            return
        }

        vendingMachine.buy(beverageType)
    }
    
    @objc
    private func updateBeverageStockLabel(notification: Notification) {

        let vendingMachine = notification.object as! VendingMachine
       
        vendingMachineInfo.matchModelAndViewHelper.forEach { (arg0) in
            
            let (objectIdentifier, beverageView) = arg0
            beverageView.stockLabel.text = "\(vendingMachine.showAllBeverageList()[objectIdentifier]?.count ?? 0)"
        }
    }
    
    
    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
    }
}
