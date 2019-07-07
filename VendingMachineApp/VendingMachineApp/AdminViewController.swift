//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/7/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet weak var bananaMilkCount: UILabel!
    @IBOutlet weak var strawberryMilkCount: UILabel!
    @IBOutlet weak var fantaCount: UILabel!
    @IBOutlet weak var topCount: UILabel!
    @IBOutlet weak var hot6Count: UILabel!
    @IBOutlet weak var pepsiCokeCount: UILabel!
    lazy var counts = [bananaMilkCount, strawberryMilkCount, fantaCount, topCount, hot6Count, pepsiCokeCount]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vendingMachine = appDelegate.vendingMachine
        
        refreshDrinkCount(vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
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
    
    private func refreshDrinkCount (_ stock: StockPrintable) {
        stock.printStock(handler:
            { drinkMenu, count in
                counts[drinkMenu.rawValue]?.text = String(count)+KoreanUnit.count.rawValue
        })
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
        refreshDrinkCount(vendingMachine)
    }
}
