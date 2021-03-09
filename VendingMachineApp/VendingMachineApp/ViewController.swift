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

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var beverageList = [Shopable]()
    private let beverageFactory = BeverageFactory0303()
    
    private var presenter = VendingMachineUpdator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageList = beverageFactory.createAll()
        
        presenter.didTurnOn(images: beverageCollection, countLabels: countCollection, machine: appDelegate.vendingMachine, moneyLabel: moneyLabel, beverageList: beverageList)
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        presenter.didAddMoneyTouched(sender: sender, machine: appDelegate.vendingMachine, label: moneyLabel)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        presenter.didAddStockTouched(sender: sender, machine: appDelegate.vendingMachine, labels: countCollection, beverageList: beverageList)
    }
}
