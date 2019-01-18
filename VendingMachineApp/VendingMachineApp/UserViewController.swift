//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet var beverageImages: [RoundedCornersImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    private weak var vendingMachine: UserMode?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()
        vendingMachine?.willAppear()
    }

    func set(vendingMachine: UserMode?) {
        self.vendingMachine = vendingMachine
    }

    private func registerAsObserver() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(showQuantities(_:)), name: .inventoryDataChanged, object: nil)
        center.addObserver(self, selector: #selector(showBalance), name: .moneyDataChanged, object: nil)
        center.addObserver(self, selector: #selector(showPurchase(_:)), name: .didBuyBeverage, object: nil)
    }

    private func updateQuantityLabel(of index: Int) {
        let count =  vendingMachine?.count(beverage: index)
        beverageLabels[index].text = "\(count ?? 0)개"
    }

    @objc private func showQuantities(_ notification: Notification) {
        if let beverage = notification.userInfo?[Notification.InfoKey.beverageQuantityChanged] as? BeverageSubCategory {
            let index = beverage.rawValue
            updateQuantityLabel(of: index)
            return
        }
        for index in beverageLabels.indices {
            updateQuantityLabel(of: index)
        }
    }

    @objc private func showBalance() {
        let balanceForm = { (money: Int) -> Void in
            self.balance.text = "잔액: \(money)원"
        }
        vendingMachine?.showBalance(with: balanceForm)
    }

    @objc private func showPurchase(_ notification: Notification) {
        guard let name = notification.userInfo?[Notification.InfoKey.nameOfPurchase] as? String else { return }
        guard let index = notification.userInfo?[Notification.InfoKey.indexOfPurchase] as? Int else { return }
        let imageView = RoundedCornersImageView(imageName: name, fileFormat: .jpg)
        imageView.relocate(to: index)
        self.view.addSubview(imageView)
    }

    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        guard vendingMachine.buy(beverage: beverage) != nil else { return }
    }

    @IBAction func insertMoneyButtonTouched(_ sender: UIButton) {
        guard let unit = Money.Unit(rawValue: sender.tag) else { return }
        guard vendingMachine?.insert(money: Money(unit: unit)) ?? false else { return }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adminViewController = segue.destination as? AdminViewController else { return }
        guard let vendingMachine = vendingMachine as? AdminMode else { return }
        adminViewController.set(vendingMachine: vendingMachine)
    }

}
