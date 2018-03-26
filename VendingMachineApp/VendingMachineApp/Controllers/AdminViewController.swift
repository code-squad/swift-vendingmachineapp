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
    
    func pieGraphView(_ pieGraphView: PieGraphView) -> PieGraphItem {
        var piePraphItem = PieGraphItem([String]())
        
        if let machine = self.vendingMachine {
            piePraphItem = PieGraphItem(machine.fetchSalesHistory())
        }
        
        return piePraphItem
    }

    @IBAction func insertBeverageAction(_ sender: UIButton) {
        let beverageMenu = BeverageMenu.getBeverageMenu(index: sender.tag)
        self.vendingMachine?.insertBeverage(beverageMenu: beverageMenu, quantity: 1)
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
