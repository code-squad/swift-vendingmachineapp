//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/18.
//

import UIKit

class AdminViewController: UIViewController,AdminVendingMachinedable {
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var numberOfStock: [UILabel]!
    
    private var vendingMachine : AdminModable!
    private var drinkMenu : BeverageMapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkMenu = BeverageMapper(drinkButtons: addStockButton)
        changeBeverageLabel()
        setNotificationObserver()
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func setVendingMachine(_ vendingMachined: AdminModable) {
        self.vendingMachine = vendingMachined
    }
    
    private func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.NotificationName.updateBeverage, object: vendingMachine)
    }
    
    private func changeBeverageLabel() {
        BeverageMapper.drinkTypeList.enumerated().forEach { index , drinkType in
            self.numberOfStock[index].text = String(vendingMachine.showBeverageStock(drinkType: drinkType))
        }
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        changeBeverageLabel()
    }
    
    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        guard let beverageType = drinkMenu[sender] else { return }
        let beverage = BeverageFactory.make(beverageType)
        vendingMachine.addStock(beverage)
    }
}
