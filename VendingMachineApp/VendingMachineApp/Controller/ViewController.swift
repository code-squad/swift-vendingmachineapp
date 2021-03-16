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
    var beverageData = BeverageData()
    var rechargeData = RechargeData()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = appDelegate.vendingMachine
        curveImageVertex()
        beverageData.setUp(buttons: beverageButtons, labels: beverageLabels)
        rechargeData.setUP(buttons: beverageButtons)
        loadSavedLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(loadSavedLabel), name: .vendingMachineNotification, object: nil)
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let type = beverageData.showType(with: sender) else { return }
        guard let product = BeverageFactory.releaseBeverage(with: type) else { return }
        vendingMachine?.addStock(as: product)
    }
    
    @IBAction func rechargeCash(_ sender: UIButton) {
        guard let cash = rechargeData.showCash(with: sender)?.rawValue else { return }
        vendingMachine?.rechargeCash(with: cash)
    }
    
    func curveImageVertex() {
        beverageImages.forEach{ (imageView) in
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
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
}

