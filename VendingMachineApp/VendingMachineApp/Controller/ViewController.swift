//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var beverageLabels: [UILabel]!
    
    let vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let id = sender.restorationIdentifier else {return}
        guard let beverage = DrinkFactory.createBeverage(with: id) else {return}
        
        vendingMachine.addStock(as: beverage)
        let label = beverageLabels.filter{$0.restorationIdentifier == id+"Label"}[0]
        let stock = vendingMachine.showStock()
        label.text = "\(stock[beverage] ?? 0)개"
    }
    
    @IBAction func rechargeCash(_ sender: UIButton) {
    }
    
}

