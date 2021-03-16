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
    var dataOfRechargeButton: [UIButton : CashManagementSystem.SelectCash] = [:]
    let beveragesType = [Cola.self, RedBull.self, StrawBerryMilk.self, TOP.self]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = appDelegate.vendingMachine
        curveImageVertex()
        fillDataOfBeverageButton()
        fillDataOfRechargeButton()
        loadSavedLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(loadSavedLabel), name: .vendingMachineNotification, object: nil)
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let type = dataOfBeverageButton[sender]?.beverageType else { return }
        guard let product = BeverageFactory.releaseBeverage(with: type) else { return }
        vendingMachine?.addStock(as: product)
    }
    
    @IBAction func rechargeCash(_ sender: UIButton) {
        guard let cash = dataOfRechargeButton[sender]?.rawValue else { return }
        vendingMachine?.rechargeCash(with: cash)
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
    
    @objc
    func loadSavedLabel() {
        for i in 0...3 {
            if let stock = vendingMachine?.showStock()[ObjectIdentifier(beveragesType[i])] {
                beverageLabels[i].text = "\(stock.count)개"
            }
        }
        guard let money = vendingMachine?.showBalance() else { return }
        balanceLabel.text = "\(money)원"
    }
    
    func fillDataOfRechargeButton() {
        dataOfRechargeButton[rechargeButtons[0]] = CashManagementSystem.SelectCash.thousand
        dataOfRechargeButton[rechargeButtons[1]] = CashManagementSystem.SelectCash.fiveThousands
    }
    
}

