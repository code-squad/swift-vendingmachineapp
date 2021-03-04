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
    
    private var presenter = VendingMachineUpdator()
    private var beverageList = [Beverage]()
    private let beverageFactory = BeverageFactory0303()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageList = beverageFactory.createAll()
        
        presenter.didTurnOn(images: beverageCollection, countLabels: countCollection, machine: vendingMachine, moneyLabel: moneyLabel, beverageList: beverageList)
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        presenter.didAddMoneyTouched(sender: sender, machine: vendingMachine, label: moneyLabel)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        presenter.didAddStockTouched(sender: sender, machine: vendingMachine, labels: countCollection, beverageList: beverageList)
    }
}
