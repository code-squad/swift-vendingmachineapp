//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 7. 17..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    @IBOutlet var inventoryLabel: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateInventory()
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateInventory(notification:)), name: .didUpdateInventory, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc private func didUpdateInventory(notification : Notification) {
        updateInventory()
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            Vendingmachine.sharedInstance().addPurchases(Coke())
        case 1:
            Vendingmachine.sharedInstance().addPurchases(ChocoMilk())
        case 2:
            Vendingmachine.sharedInstance().addPurchases(StrawberryMilk())
        case 3:
            Vendingmachine.sharedInstance().addPurchases(Top())
        case 4:
            Vendingmachine.sharedInstance().addPurchases(Sprite())
        default:
            return
        }
    }
    
    private func updateInventory() {
        let kinds = Vendingmachine.sharedInstance().makeKindOfBeverage()
        for index in inventoryLabel.indices {
            self.inventoryLabel[index].text = "\(Vendingmachine.sharedInstance().countOfInventory(kinds[index]))개"
        }
    }
}
