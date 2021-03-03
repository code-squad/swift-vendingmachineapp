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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachineDelegate.didTurnOn(images: beverageCollection, countLabels: countCollection, machine: vendingMachine, moneyLabel: moneyLabel)
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        vendingMachineDelegate.didAddMoneyTouched(sender: sender, machine: vendingMachine, label: moneyLabel)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        vendingMachineDelegate.didAddStockTouched(sender: sender, machine: vendingMachine, labels: countCollection)
    }
}
