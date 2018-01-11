//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var receiptView: UIScrollView!
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
        let boundRatio: CGFloat = 15.0
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
        self.sortedBeverageLabel = match(labels: stockLabel, sequence: beverages)
        self.sortedBuyButton = match(buttons: buyButtonGroup, sequence: beverages)
        self.sortedAddButton = match(buttons: addButtonGroup, sequence: beverages)
        initStockLabel()
    }
    
    private func initStockLabel() {
        for beverage in sortedBeverageLabel {
            setLabelContents(key: beverage.key, label: beverage.value)
        }
        for index in 0..<VendingMachineData.sharedInstance.receipt.count {
            makeReceiptView(beverage: VendingMachineData.sharedInstance.receipt[index], count: index)
        }
    }
    
    private func match(buttons: [UIButton], sequence beverages: [Beverage]) -> [UIButton: Beverage] {
        var matchedButton = [UIButton: Beverage]()
        for index in 0..<buttons.count {
            matchedButton[buttons[index]] = beverages[index]
        }
        return matchedButton
    }
    
    private func match(labels: [UILabel], sequence beverages: [Beverage]) -> [Beverage: UILabel] {
        var beverageLabel = [Beverage: UILabel]()
        for index in 0..<labels.count {
            beverageLabel[beverages[index]] = labels[index]
        }
        return beverageLabel
    }
    
    @objc private func updateRecepitView(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let beverage = userInfo["recepit"] as? Beverage else { return }
        guard let receiptCount = userInfo["count"] as? Int else { return }
        makeReceiptView(beverage: beverage, count: receiptCount)
    }
    
    private func makeReceiptView(beverage: Beverage, count: Int) {
        guard let beverageImg = UIImage(named: beverage.description) else { return }
        let beverageImgView = UIImageView(image: beverageImg)
        let imgRatio = CGFloat(3)
        let xPoint = CGFloat((beverageImg.size.width/imgRatio) * CGFloat(count - 1))
        beverageImgView.frame = CGRect(x: xPoint, y: 0,
                                       width: beverageImg.size.width/imgRatio,
                                       height: beverageImg.size.height/imgRatio)
        self.receiptView.addSubview(beverageImgView)
        self.receiptView.contentSize =  CGSize(width: beverageImgView.frame.size.width * CGFloat(count),
                                               height: beverageImgView.frame.size.height)
        
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
        } catch let error as ErrorCode {
            let alert = UIAlertController(title: "VendingMachine", message: error.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } catch {
            print("other error")
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
