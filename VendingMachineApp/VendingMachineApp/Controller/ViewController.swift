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
    @IBOutlet var rechargeButtons: [UIButton]!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachine: VendingMachine?
    var dataOfBeverageButton: [UIButton : (beverage: Beverage, label: UILabel)] = [:]
    var dataOfRechargeButton: [UIButton : Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = appDelegate.vendingMachine
        curveImageVertex()
        fillDataOfBeverageButton()
        fillDataOfRechargeButton()
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let beverage = dataOfBeverageButton[sender]?.beverage else {return}
        vendingMachine!.addStock(as: beverage)
        let stockList = vendingMachine!.showStock()
        let beverageID = ObjectIdentifier(beverage)
        guard let stock = stockList[beverageID] else {return}
        dataOfBeverageButton[sender]?.label.text = "\(stock.count)개"
    }
    
    @IBAction func rechargeCash(_ sender: UIButton) {
        guard let cash = dataOfRechargeButton[sender] else {return}
        vendingMachine!.rechargeCash(with: cash)
        balanceLabel.text = "\(vendingMachine!.showBalance().description)원"
    }
    
    func curveImageVertex() {
        beverageImages.forEach{ (imageView) in
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
        }
    }
    
    func fillDataOfBeverageButton() {
        let factories: [Produceable] = [ColaFactory.init(), RedBullFactory.init(), StrawberryMilkFactory.init(), TOPFactory.init()]
        for i in 0...3 {
            dataOfBeverageButton[beverageButtons[i]] = (BeverageFactory.releaseBeverage(with: factories[i]), beverageLabels[i])
        }
    }
    
    func fillDataOfRechargeButton() {
        dataOfRechargeButton[rechargeButtons[0]] = 1000
        dataOfRechargeButton[rechargeButtons[1]] = 5000
    }
    
}

