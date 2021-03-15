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
    var dataOfBeverageButton: [UIButton : (beverageType: Beverage.Type, label: UILabel)] = [:]
    var dataOfRechargeButton: [UIButton : Int] = [:]
    let beveragesType = [Cola.self, RedBull.self, StrawBerryMilk.self, TOP.self]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = appDelegate.vendingMachine
        curveImageVertex()
        fillDataOfBeverageButton()
        fillDataOfRechargeButton()
        loadSavedLabel()
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let type = dataOfBeverageButton[sender]?.beverageType else {return}
        guard let product = BeverageFactory.releaseBeverage(with: type) else {return}
        vendingMachine!.addStock(as: product)
        let stockList = vendingMachine!.showStock()
        let beverageID = ObjectIdentifier(type)
        guard let stock = stockList[beverageID] else {return}
        dataOfBeverageButton[sender]?.label.text = "\(stock.count)개"
        print(vendingMachine!.showStock())
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
        for i in 0...3 {
            dataOfBeverageButton[beverageButtons[i]] = (beveragesType[i], beverageLabels[i])
        }
    }
    
    func loadSavedLabel() {
        for i in 0...3 {
            if let stock = vendingMachine!.showStock()[ObjectIdentifier(beveragesType[i])] {
                beverageLabels[i].text = "\(stock.count)개"
            }
        }
    }
    
    func fillDataOfRechargeButton() {
        dataOfRechargeButton[rechargeButtons[0]] = 1000
        dataOfRechargeButton[rechargeButtons[1]] = 5000
    }
    
}

