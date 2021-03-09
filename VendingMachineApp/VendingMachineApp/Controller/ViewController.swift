//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageButtons: [BeverageButtons]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    let vendingMachine = VendingMachine()
    var dataOfButtonAndLabel: [UIButton: UILabel] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        curveImageVertex()
        fillButtonAndLabelData()
    }
    
    @IBAction func addStock(_ sender: BeverageButtons) {
        sender.action { (beverage) in
            vendingMachine.addStock(as: beverage)
            guard let beverageCount = vendingMachine.showStock()[ObjectIdentifier(beverage)]?.count else {return}
            dataOfButtonAndLabel[sender]?.text = "\(beverageCount)개"
        }
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
    
    func curveImageVertex() {
        beverageImages.forEach{ (imageView) in
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
        }
    }
    
    func fillButtonAndLabelData() {
        for i in 0...3 {
            dataOfButtonAndLabel[beverageButtons[i]] = beverageLabels[i]
        }
    }
    
}

