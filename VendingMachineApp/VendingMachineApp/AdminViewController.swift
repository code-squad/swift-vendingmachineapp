
//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 16..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    var adminVendingMachine : AdminMode?
    
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var labelOfProducts: [UILabel]!
    @IBOutlet var addInventory: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInventory()
        NotificationCenter.default.addObserver(self, selector: #selector(updateInventoryLabels(notification:)), name: .didUpdateInventory , object: nil)
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func updateInventoryLabels(notification : Notification) {
        updateInventory()
    }
    
    @IBAction func addInventoryButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.adminVendingMachine else { return }
        let productByTouch = vendingMachine.generateProductSelected(sender.tag)
        vendingMachine.addBeverage(productByTouch)
    }
    
    private func updateInventory() {
        guard let vendingMachine = self.adminVendingMachine else { return }
        var inventoryIndex = 0
        for countOfOneProduct in vendingMachine.generateCountOfProduct() {
            labelOfProducts[inventoryIndex].text = countOfOneProduct.formatCount()
            inventoryIndex += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateInventory()
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
