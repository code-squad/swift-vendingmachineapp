//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by yuaming on 22/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, PieGraphViewDataSource {
    @IBOutlet weak var pieGraphView: PieGraphView!
    @IBOutlet var addedBeverageButtons: [UIButton]!
    
    private var vendingMachine: (Userable & MachineManagerable & InventoryCountable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pieGraphView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pieGraphView.setNeedsDisplay()
    }

    func fillData(_ data: Userable & MachineManagerable & InventoryCountable) {
        self.vendingMachine = data
    }
    
    func changeContent(_ pieGraphView: PieGraphView) -> PieGraphItem {
        var pieGraphItem = PieGraphItem([String]())
        
        if let machine = self.vendingMachine {
            pieGraphItem = PieGraphItem(machine.fetchSalesHistory())
        }
        
        return pieGraphItem
    }

    @IBAction func insertBeverageAction(_ sender: UIButton) {
        let beverageMenu = BeverageMenu.getBeverageMenu(index: sender.tag)
        self.vendingMachine?.insertBeverage(beverageMenu: beverageMenu, quantity: 1)
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
