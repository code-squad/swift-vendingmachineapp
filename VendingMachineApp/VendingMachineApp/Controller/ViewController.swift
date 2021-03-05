//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var beverageImages: [UIImageView]!
    
    let vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
        beverageImages.forEach{ (imageView) in
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
        }
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
        guard let id = sender.restorationIdentifier else {return}
        switch id {
        case "1000":
            vendingMachine.rechargeCash(with: 1000)
        case "5000":
            vendingMachine.rechargeCash(with: 5000)
        default:
            break
        }
        balanceLabel.text = "잔액: \(vendingMachine.showBalance().description)원"
    }
    
}

