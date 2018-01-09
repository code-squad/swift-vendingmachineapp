//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var stockLabel: [UILabel]!
    @IBOutlet var buttonGroup: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    private let countingUnit = "개"
    private let fiveThounsand = 5000
    private let oneThounsand = 1000
    private let keyBox = [LightBananaMilk(), Coke(), StarBucksCoffee(), Sprite(), CeylonTea()]

    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 15.0
        buttonGroup.forEach { $0.layer.cornerRadius = boundRatio }
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(notification:)),
                                               name: .labelNC,
                                               object: nil)
        initStockLabel()
    }
    
    @objc private func updateStockLabel(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["beverage"] as? Beverage else { return }
        guard let indexOfLabel = keyBox.index(of: beverage) else { return }
        setLabelContents(label: stockLabel[indexOfLabel], key: beverage)
    }
    
    private func initStockLabel() {
        balanceLabel.text = String(VendingMachineData.sharedInstance.balance.commaRepresentation)
        for index in 0..<stockLabel.count {
            setLabelContents(label: stockLabel[index], key: keyBox[index])
        }
    }
    
    private func setLabelContents(label: UILabel, key: Beverage) {
        if let sortedBeverage = VendingMachineData.sharedInstance.sortedStockList[key] {
            label.text = "\(sortedBeverage)" + countingUnit
        } else {
            label.text = "0" + countingUnit
        }
    }
    
    @IBAction func bananaAddTouched(_ sender: Any) {
        let lightBanana = LightBananaMilk(manufacturingDate: Date())
        VendingMachineData.sharedInstance.addBeverage(lightBanana)
    }
    
    @IBAction func cokeAddTouched(_ sender: Any) {
        let coke = Coke(manufacturingDate: Date())
        VendingMachineData.sharedInstance.addBeverage(coke)
    }
    
    @IBAction func starBucksAddTouched(_ sender: Any) {
        let starBucks = StarBucksCoffee(manufacturingDate: Date())
        VendingMachineData.sharedInstance.addBeverage(starBucks)
    }
    
    @IBAction func spriteAddTouched(_ sender: Any) {
        let sprite = Sprite(manufacturingDate: Date())
        VendingMachineData.sharedInstance.addBeverage(sprite)
    }
    
    @IBAction func ceylonAddTouched(_ sender: Any) {
        let ceylonTea = CeylonTea(manufacturingDate: Date())
        VendingMachineData.sharedInstance.addBeverage(ceylonTea)
    }
    
    @IBAction func addFiveBalanceTouched(_ sender: Any) {
        VendingMachineData.sharedInstance.insertMoney(fiveThounsand)
        balanceLabel.text = VendingMachineData.sharedInstance.balance.commaRepresentation
    }
    
    @IBAction func addOneBalanceTouched(_ sender: Any) {
        VendingMachineData.sharedInstance.insertMoney(oneThounsand)
        balanceLabel.text = VendingMachineData.sharedInstance.balance.commaRepresentation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Int {
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

extension Notification.Name {
    static let labelNC = Notification.Name("labelNC")
}
