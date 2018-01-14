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

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(notification:)),
                                               name: .labelNC,
                                               object: nil)
        self.sortedBeverageLabel = AppSetting.matches(indexList: AppSetting.keyBox, valueList: stockLabelGroup)
        self.sortedAddButton = AppSetting.matches(indexList: addButtonGroup, valueList: AppSetting.keyBox)
        initStockLabel()
    }
    
    private func initStockLabel() {
        for beverage in sortedBeverageLabel {
           AppSetting.setLabelContent(key: beverage.key, stockLabel: beverage.value)
        }
    }
    
    @objc private func updateStockLabel(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["beverage"] as? Beverage else { return }
        guard let beverageLabel = sortedBeverageLabel[beverage] else { return }
        AppSetting.setLabelContent(key: beverage, stockLabel: beverageLabel)
    }
    
    @IBAction func addTouched(_ sender: UIButton) {
        guard let item = sortedAddButton[addButtonGroup[sender.tag]] else { return }
        VendingMachineData.sharedInstance.addBeverage(item)
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
