//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var vendingmachine: Vendingmachine
    @IBOutlet weak var balance: UILabel!
    
    let beverages = BeverageFactory().setBeverage()
    
    required init?(coder aDecoder: NSCoder) {
        vendingmachine = Vendingmachine(beverages)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showInventory()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addMoneyButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vendingmachine.addBalance(1000)
        case 1:
            vendingmachine.addBalance(5000)
        default:
            return
        }
        addBalanceLabel()
    }
    
    func addBalanceLabel() {
        self.balance.text = "\(vendingmachine.checkBalance())원"
    }
    
    
    
    private func showInventory() {
        print("=> ", terminator: "")
        let beverage = vendingmachine.makeKindOfBeverage()
        for item in beverage {
            let beverages = vendingmachine[item]
            if let kinds = beverages?.map({$0.kind}) {
                print("\(kinds.first ?? "")(\(kinds.count)개) ", terminator: "")
            }
        }
    }

}

