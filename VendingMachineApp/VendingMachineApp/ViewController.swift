//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageCollection: [UIImageView]!
    @IBOutlet var countCollection: [UILabel]!
    @IBOutlet weak var moneyLabel: UILabel!

    private var vendingMachine = VendingMachine(dateStandard: Date(),
                                        temperatureStandard: 36.5,
                                        sugarStandard: 1.0,
                                        lactoStandard: 0.5)
    
    private var vendingMachineDelegate = VendingMachineUpdator()
    private var beverageList = [Beverage]()
    private let beverageFactory = BeverageFactory0303.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listUp()
        
        vendingMachineDelegate.didTurnOn(images: beverageCollection, countLabels: countCollection, machine: vendingMachine, moneyLabel: moneyLabel, beverageList: beverageList)
    }
    
    private func listUp() {
        beverageFactory.allCases.forEach { (beverage) in
            beverageList.append(beverage.create())
        }
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        vendingMachineDelegate.didAddMoneyTouched(sender: sender, machine: vendingMachine, label: moneyLabel)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        vendingMachineDelegate.didAddStockTouched(sender: sender, machine: vendingMachine, labels: countCollection, beverageList: beverageList)
    }
}
