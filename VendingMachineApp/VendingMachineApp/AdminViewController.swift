//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/7/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet weak var pieChartView: PieGraphView!
    @IBOutlet var drinksCount: [UILabel]!
    
    private var vendingMachine: VendingMachineManagementable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshDrinkCount()
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pieChartView.dataSource = vendingMachine
        super.viewWillAppear(false)
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func drinkSupply(_ sender: UIButton) {
        let drinkMenu = DrinkMenu(rawValue: sender.tag)
        
        if let drinkMenu = drinkMenu {
            vendingMachine.supply(drinkMenu, amount: 1)
        }
    }
    
    private func refreshDrinkCount () {
        vendingMachine.printStock(handler:
            { drinkMenu, count in
                drinksCount [drinkMenu.rawValue].text = String(count)+KoreanUnit.count.rawValue
        })
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
        refreshDrinkCount()
    }
    
    func referToVendingMachineManagementable (_ vendingMachineManagementable: VendingMachineManagementable) {
        vendingMachine = vendingMachineManagementable
    }
}
