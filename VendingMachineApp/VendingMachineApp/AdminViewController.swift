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
    @IBOutlet var inventoryButton: [UIButton]!
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
        let inventory = Vendingmachine.removeRepeatedBeverage()
        
        if let index = inventoryButton.index(of: sender) {
            Vendingmachine.sharedInstance().addPurchases(inventory[index])
        }
    }
    
    private func updateInventory() {
        let kinds = Vendingmachine.sharedInstance().makeKindOfBeverage()
        for index in inventoryLabel.indices {
            self.inventoryLabel[index].text = "\(Vendingmachine.sharedInstance().countOfInventory(kinds[index]))개"
        }
    }
}
