//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 22/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet var addedBeverageButtons: [UIButton]!
    
    private var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fillData(_ data: Userable & MachineManagerable & InventoryCountable) {
        self.vendingMachine = data
    }

    @IBAction func insertBeverageAction(_ sender: UIButton) {
        let beverageMenu = BeverageMenu.getBeverageMenu(index: sender.tag)
        self.vendingMachine?.insertBeverage(beverageMenu: beverageMenu, quantity: 1)
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
