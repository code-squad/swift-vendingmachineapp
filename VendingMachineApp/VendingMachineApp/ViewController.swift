//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var vendingMachine = VendingMachine()

    let vendingMachineView = VendingMachineView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine = delegate.vendingMachine
        let stockList = vendingMachine.showStock()
        let moneyBox = vendingMachine.checkMoney()
        
        vendingMachineView.setting(with: stockList, howMuch: moneyBox)
        self.view.addSubview(vendingMachineView)
    }
    
    @objc func doAddStockButton(sender : AddStockButton) {
        vendingMachine.addStock(what: sender.beverageType)
        NotificationCenter.default.post(name: .stockChanged, object: vendingMachine.showStock())
    }
    
    @objc func doAddBalance(sender : BalanceButton) {
        vendingMachine.insertMoney(howMuch: sender.addingValue)
        NotificationCenter.default.post(name: .balanceChanged, object: vendingMachine.checkMoney())
    }
}
