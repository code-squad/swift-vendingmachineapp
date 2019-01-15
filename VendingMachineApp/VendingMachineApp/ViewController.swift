//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private weak var vendingMachine: VendingMachine?
    @IBOutlet var beverageImages: [RoundedCornersImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    required init?(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine.shared
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()
        vendingMachine?.willAppear()
    }

    private func registerAsObserver() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(showQuantities), name: .inventoryDataChanged, object: nil)
        center.addObserver(self, selector: #selector(showBalance), name: .moneyDataChanged, object: nil)
        center.addObserver(self, selector: #selector(showPurchase(_:)), name: .didBuyBeverage, object: nil)
    }

    @objc private func showQuantities() {
        for (index, quantity) in beverageLabels.enumerated() {
            let count =  vendingMachine?.count(beverage: index)
            quantity.text = "\(count ?? 0)개"
        }
    }

    @objc private func showBalance() {
        let balanceForm = { (money: Int) -> Void in
            self.balance.text = "잔액: \(money)원"
        }
        vendingMachine?.showBalance(with: balanceForm)
    }

    @objc private func showPurchase(_ notification: Notification) {
        guard let name = notification.userInfo?["name"] as? String else { return }
        guard let index = notification.userInfo?["index"] as? Int else { return }
        let imageView = RoundedCornersImageView(imageName: name, fileFormat: .jpg)
        imageView.relocate(to: index)
        self.view.addSubview(imageView)
    }

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        vendingMachine.add(beverage: beverage)
    }

    @IBAction func buyBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        guard vendingMachine.buy(beverage: beverage) != nil else { return }
    }

    @IBAction func insertMoney(_ sender: UIButton) {
        guard let unit = Money.Unit(rawValue: sender.tag) else { return }
        guard vendingMachine?.insert(money: Money(unit: unit)) ?? false else { return }
    }

}
