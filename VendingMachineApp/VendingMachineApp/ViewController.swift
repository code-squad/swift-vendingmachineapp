//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var receiptScroll: UIScrollView!
    @IBOutlet var buyButtonGroup: [UIButton]!
    @IBOutlet var addButtonGroup: [UIButton]!
    @IBOutlet var stockLabel: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    private var sortedBeverageLabel = [Beverage: UILabel]()
    private var sortedBuyButton = [UIButton: Beverage]()
    private var sortedAddButton = [UIButton: Beverage]()
    private let countingUnit = "개"
    private let fiveThounsand = 5000
    private let oneThounsand = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 35.0
        addButtonGroup.forEach { $0.layer.cornerRadius = boundRatio }
        let beverages = [LightBananaMilk(), Coke(), StarBucksCoffee(), Sprite(), CeylonTea()]
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockLabel(notification:)),
                                               name: .labelNC,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateRecepitView(notification:)),
                                               name: .recepitNC,
                                               object: nil)
        self.sortedBeverageLabel = matches(indexList: beverages, valueList: stockLabel)
        self.sortedBuyButton = matches(indexList: buyButtonGroup, valueList: beverages)
        self.sortedAddButton = matches(indexList: addButtonGroup, valueList: beverages)
        initStockLabel()
    }
    
    private func initStockLabel() {
        for beverage in sortedBeverageLabel {
            setLabelContents(key: beverage.key, label: beverage.value)
        }
        for beverage in VendingMachineData.sharedInstance.receipt {
            fillReceiptScrollView(beverage)
        }
    }
    
    private func matches<T, U>(indexList: [T], valueList: [U]) -> [T: U] {
        var matchedList = [T: U]()
        for index in 0..<indexList.count {
            matchedList[indexList[index]] = valueList[index]
        }
        return matchedList
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
        setLabelContents(key: beverage, label: beverageLabel)
    }
    
    private func setLabelContents(key: Beverage, label: UILabel) {
        balanceLabel.text = String(VendingMachineData.sharedInstance.balance.commaRepresentation)
        if let sortedBeverage = VendingMachineData.sharedInstance.sortedStockList[key] {
            label.text = "\(sortedBeverage)" + countingUnit
        } else {
            label.text = "0" + countingUnit
        }
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
    
    @IBAction func addTouched(_ sender: UIButton) {
        guard let item = sortedAddButton[addButtonGroup[sender.tag]] else { return }
        VendingMachineData.sharedInstance.addBeverage(item)
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
    static let recepitNC = Notification.Name("recepitNC")
}
