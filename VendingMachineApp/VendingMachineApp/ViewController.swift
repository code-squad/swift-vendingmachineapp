//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

// MARK: - NSNotification.Name
extension NSNotification.Name {
    static let addBeverage = NSNotification.Name(rawValue: "addBeverage")
    static let insertMoney = NSNotification.Name(rawValue: "insertMoney")
    static let purchaseList = NSNotification.Name(rawValue: "purchaseList")
    static let moneyChange = NSNotification.Name(rawValue: "moneyChange")
}

class ViewController: UIViewController {

    // MARK: - private variable
    private var vendingMachine: VendingMachine?

    // MARK: - @IBOutlet
    @IBOutlet var beverageImageView: [RoundImageView]!
    @IBOutlet var beverageLabel: [UILabel]!
    @IBOutlet weak var list: UILabel!
    @IBOutlet var buyButton: [UIButton]!

    // MARK: - init
    required init?(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine.shared
        super.init(coder: aDecoder)
    }

    // MARK: - private
    private func showQuantity() {
        for (index, count) in beverageLabel.enumerated() {
            if let number = vendingMachine?.count(beverage: index) {
                count.text = "\(number)개"
                continue
            }
            count.text = "0개"
        }
    }

    private func showQuantity(index: Int) {
        let count = vendingMachine?.count(beverage: index)
        beverageLabel[index].text = "\(count ?? 0)개"
    }

    private func moneyFormat(money: Int) {
        self.list.text = "\(money.commaRepresentation)"
    }

    // MARK: - @IBAction
    @IBAction func addBeverage(_ sender: UIButton) {
        let beverage = sender.tag
        guard vendingMachine?.add(beverage: beverage) ?? false else { return }
    }

    @IBAction func buyBeverage(_ sender: UIButton) {
        guard let beverage = BeverageTypeName(rawValue: sender.tag) else { return }
        guard vendingMachine?.buyBeverage(beverage: beverage) != nil else { return }
    }

    @IBAction func inputMoney(_ sender: UIButton) {
        guard let unit = AvailableMoney(rawValue: sender.tag) else { return }
        guard vendingMachine?.isPut(cash: unit.value) ?? true else { return }
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(objcShowQuantity(_:)), name: .addBeverage, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(objcMoneyFormat), name: .insertMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(objcPurchaseListHistory(_:)), name: .purchaseList, object: nil)

        vendingMachine?.viewAppear()

    }

    // MARK: - @objc
    @objc private func objcShowQuantity(_ notification: Notification) {
        if let data = notification.userInfo?[Notification.NotiKey.purchaseIndex] as? Int {
            showQuantity(index: data)
            return
        }
        for data in beverageLabel.indices {
            showQuantity(index: data)
        }
    }

    @objc private func objcMoneyFormat(money: Int) {
        let moneyFormat = { (money: Int) -> Void in
            self.list.text = "\(money.commaRepresentation)"
        }
        vendingMachine?.showList(show: moneyFormat)
    }

    @objc func objcPurchaseListHistory(_ notification: Notification) {
        guard let imgName = notification.userInfo?[Notification.NotiKey.purchaseName] as? String else { return }
        guard let historyNumber = notification.userInfo?[Notification.NotiKey.purchaseIndex] as? Int else { return }
        let imageView = RoundImageView(imageName: imgName, form: .jpg)
        imageView.moveImageView(index: historyNumber)
        self.view.addSubview(imageView)
    }
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adminViewController = segue.destination as? AdminViewController else { return }
        guard let vendingMachine = vendingMachine as? Manager else { return }
        adminViewController.set(vendingMachine: vendingMachine)
    }
}
