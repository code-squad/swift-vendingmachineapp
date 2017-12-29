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
    private var vendingMachine = VendingMachineData()
    private let countingUnit = "개"
    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 15.0
        for button in buttonGroup {
            button.layer.cornerRadius = boundRatio
        }
    }
    @IBAction func bananaAddTouched(_ sender: Any) {
        let lightBanana = LightBananaMilk(manufacturingDate: Date())
        vendingMachine.addBeverage(lightBanana)
        stockLabel[0].text = "\(vendingMachine.sortedStockList[lightBanana]!)" + countingUnit
    }
    @IBAction func cokeAddTouched(_ sender: Any) {
        let coke = Coke(manufacturingDate: Date())
        vendingMachine.addBeverage(coke)
        stockLabel[1].text = "\(vendingMachine.sortedStockList[coke]!)" + countingUnit
    }
    @IBAction func starBucksAddTouched(_ sender: Any) {
        let starBucks = StarBucksCoffee(manufacturingDate: Date())
        vendingMachine.addBeverage(starBucks)
        stockLabel[2].text = "\(vendingMachine.sortedStockList[starBucks]!)" + countingUnit
    }
    @IBAction func spriteAddTouched(_ sender: Any) {
        let sprite = Sprite(manufacturingDate: Date())
        vendingMachine.addBeverage(sprite)
        stockLabel[3].text = "\(vendingMachine.sortedStockList[sprite]!)" + countingUnit
    }
    @IBAction func ceylonAddTouched(_ sender: Any) {
        let ceylonTea = CeylonTea(manufacturingDate: Date())
        vendingMachine.addBeverage(ceylonTea)
        stockLabel[4].text = "\(vendingMachine.sortedStockList[ceylonTea]!)" + countingUnit
    }
    @IBAction func addFiveBalanceTouched(_ sender: Any) {
        vendingMachine.insertMoney(5000)
        balanceLabel.text = vendingMachine.balance.commaRepresentation
    }
    @IBAction func addTenBalanceTouched(_ sender: Any) {
        vendingMachine.insertMoney(1000)
        balanceLabel.text = vendingMachine.balance.commaRepresentation
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
