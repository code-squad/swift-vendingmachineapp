//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 12..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet var addButtonGroup: [UIButton]!
    @IBOutlet var stockLabelGroup: [UILabel]!
    private var sortedBeverageLabel = [Beverage: UILabel]()
    private var sortedAddButton = [UIButton: Beverage]()
    private let countingUnit = "개"

    override func viewDidLoad() {
        super.viewDidLoad()
        let beverages = [LightBananaMilk(), Coke(), StarBucksCoffee(), Sprite(), CeylonTea()]
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(notification:)),
                                               name: .labelNC,
                                               object: nil)
        self.sortedBeverageLabel = matches(indexList: beverages, valueList: stockLabelGroup)
        self.sortedAddButton = matches(indexList: addButtonGroup, valueList: beverages)
        initStockLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initStockLabel()
    }
    
    private func matches<T, U>(indexList: [T], valueList: [U]) -> [T: U] {
        var matchedList = [T: U]()
        for index in 0..<indexList.count {
            matchedList[indexList[index]] = valueList[index]
        }
        return matchedList
    }
    
    private func initStockLabel() {
        for beverage in sortedBeverageLabel {
            setLabelContents(key: beverage.key, label: beverage.value)
        }
    }
    
    @objc private func updateStockLabel(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["beverage"] as? Beverage else { return }
        guard let beverageLabel = sortedBeverageLabel[beverage] else { return }
        setLabelContents(key: beverage, label: beverageLabel)
    }
    
    private func setLabelContents(key: Beverage, label: UILabel) {
        if let sortedBeverage = VendingMachineData.sharedInstance.sortedStockList[key] {
            label.text = "\(sortedBeverage)" + countingUnit
        } else {
            label.text = "0" + countingUnit
        }
    }
    
    @IBAction func addTouched(_ sender: UIButton) {
        guard let item = sortedAddButton[addButtonGroup[sender.tag]] else { return }
        VendingMachineData.sharedInstance.addBeverage(item)
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
