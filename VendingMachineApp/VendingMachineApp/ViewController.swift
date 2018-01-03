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
    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 15.0
        buttonGroup.forEach { $0.layer.cornerRadius = boundRatio }
        setViewDidLoad()
    }
    private func setViewDidLoad() {
        balanceLabel.text = String(vendingMachine.balance.commaRepresentation)
        let keyBox = [LightBananaMilk(), Coke(), StarBucksCoffee(), Sprite(), CeylonTea()]
        for index in 0..<stockLabel.count {
            setLabelContents(label: index, key: keyBox[index])
        }
    }
    private func setLabelContents(label index: Int, key: Beverage) {
        if let sortedBeverage = vendingMachine.sortedStockList[key] {
            stockLabel[index].text = "\(sortedBeverage)" + countingUnit
        } else {
            stockLabel[index].text = "0" + countingUnit
        }
    }
    @IBAction func bananaAddTouched(_ sender: Any) {
        let lightBanana = LightBananaMilk(manufacturingDate: Date())
        vendingMachine.addBeverage(lightBanana)
        setLabelContents(label: 0, key: lightBanana)
    }
    @IBAction func cokeAddTouched(_ sender: Any) {
        let coke = Coke(manufacturingDate: Date())
        vendingMachine.addBeverage(coke)
        setLabelContents(label: 1, key: coke)
    }
    @IBAction func starBucksAddTouched(_ sender: Any) {
        let starBucks = StarBucksCoffee(manufacturingDate: Date())
        vendingMachine.addBeverage(starBucks)
        setLabelContents(label: 2, key: starBucks)
    }
    @IBAction func spriteAddTouched(_ sender: Any) {
        let sprite = Sprite(manufacturingDate: Date())
        vendingMachine.addBeverage(sprite)
        setLabelContents(label: 3, key: sprite)
    }
    @IBAction func ceylonAddTouched(_ sender: Any) {
        let ceylonTea = CeylonTea(manufacturingDate: Date())
        vendingMachine.addBeverage(ceylonTea)
        setLabelContents(label: 4, key: ceylonTea)
    }
    @IBAction func addFiveBalanceTouched(_ sender: Any) {
        vendingMachine.insertMoney(fiveThounsand)
        balanceLabel.text = vendingMachine.balance.commaRepresentation
        UserDefaults.standard.integer(forKey: "balance")
    }
    @IBAction func addOneBalanceTouched(_ sender: Any) {
        vendingMachine.insertMoney(oneThounsand)
        balanceLabel.text = vendingMachine.balance.commaRepresentation
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
extension ViewController {
    var vendingMachine: VendingMachineData {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return VendingMachineData()
        }
        return appDelegate.vendingMachine
    }
}
