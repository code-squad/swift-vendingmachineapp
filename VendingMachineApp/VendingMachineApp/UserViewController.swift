//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var receiptScroll: UIScrollView!
    @IBOutlet var buyButtonGroup: [UIButton]!
    @IBOutlet var stockLabelGroup: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    private var sortedBeverageLabel = [Beverage: UILabel]()
    private var sortedBuyButton = [UIButton: Beverage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 35.0
        buyButtonGroup.forEach { $0.layer.cornerRadius = boundRatio }
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(notification:)),
                                               name: .labelNC,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateRecepitView(notification:)),
                                               name: .recepitNC,
                                               object: nil)
        self.sortedBeverageLabel = AppSetting.matches(indexList: AppSetting.keyBox, valueList: stockLabelGroup)
        
        self.sortedBuyButton = AppSetting.matches(indexList: buyButtonGroup, valueList: AppSetting.keyBox)
        initStockLabel()
    }
    
    private func initStockLabel() {
        for beverage in sortedBeverageLabel {
            AppSetting.setLabelContent(key: beverage.key, stockLabel: beverage.value, balanceLabel: balanceLabel)
        }
        for beverage in VendingMachineData.sharedInstance.receipt {
            fillReceiptScrollView(beverage)
        }
    }
    
    @objc private func updateRecepitView(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["beverage"] as? Beverage else { return }
        fillReceiptScrollView(beverage)
    }
    
    private func fillReceiptScrollView(_ beverage: Beverage) {
        guard let beverageImg = UIImage(named: beverage.description) else { return }
        let beverageImgView = UIImageView(image: beverageImg)
        self.receiptScroll.addSubview(beverageImgView)
        adjustImageCoordinate()
        self.receiptScroll.contentSize = CGSize(width: beverageImgView.frame.width * CGFloat(self.receiptScroll.subviews.count - 1),
                                                height: beverageImgView.frame.height)
    }
    
    private func adjustImageCoordinate() {
        let indexOfsubView = self.receiptScroll.subviews.count - 1
        let boughtBeverageOrigin = CGPoint(x: self.receiptScroll.subviews[indexOfsubView].frame.size.width * CGFloat(indexOfsubView - 1), y: 0)
        self.receiptScroll.subviews[indexOfsubView].frame = CGRect(origin: boughtBeverageOrigin, size: self.receiptScroll.subviews[indexOfsubView].frame.size)
    }
    
    @objc private func updateStockLabel(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["beverage"] as? Beverage else { return }
        guard let beverageLabel = sortedBeverageLabel[beverage] else { return }
        AppSetting.setLabelContent(key: beverage, stockLabel: beverageLabel, balanceLabel: balanceLabel)
    }
    
    @IBAction func buyTouched(_ sender: UIButton) {
        guard let item = sortedBuyButton[buyButtonGroup[sender.tag]] else { return }
        do {
            try VendingMachineData.sharedInstance.buyBeverage(item)
        } catch {
            let error = (error as? ErrorCode) ?? ErrorCode.inValidError
            let alert = UIAlertController(title: "VendingMachine", message: error.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func addFiveBalanceTouched(_ sender: Any) {
        VendingMachineData.sharedInstance.insertMoney(AppSetting.fiveThounsand)
        balanceLabel.text = VendingMachineData.sharedInstance.balance.commaRepresentation
    }
    
    @IBAction func addOneBalanceTouched(_ sender: Any) {
        VendingMachineData.sharedInstance.insertMoney(AppSetting.oneThounsand)
        balanceLabel.text = VendingMachineData.sharedInstance.balance.commaRepresentation
    }
}

extension Notification.Name {
    static let labelNC = Notification.Name("labelNC")
    static let recepitNC = Notification.Name("recepitNC")
}
