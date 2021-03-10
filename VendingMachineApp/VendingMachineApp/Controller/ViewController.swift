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
    @IBOutlet var beverageButtons: [UIButton]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    let vendingMachine = VendingMachine()
    var dataOfButton: [UIButton : (beverage: Beverage, label: UILabel)] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        curveImageVertex()
        fillDataOfButton()
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let beverage = dataOfButton[sender]?.beverage else {return}
        vendingMachine.addStock(as: beverage)
        let stockList = vendingMachine.showStock()
        let beverageID = ObjectIdentifier(beverage)
        guard let stock = stockList[beverageID] else {return}
        dataOfButton[sender]?.label.text = "\(stock.count)개"
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
    
    func fillDataOfButton() {
        let factories: [Produceable] = [ColaFactory.init(), RedBullFactory.init(), StrawberryMilkFactory.init(), TOPFactory.init()]
        for i in 0...3 {
            dataOfButton[beverageButtons[i]] = (BeverageFactory.releaseBeverage(with: factories[i]), beverageLabels[i])
        }
    }
}

