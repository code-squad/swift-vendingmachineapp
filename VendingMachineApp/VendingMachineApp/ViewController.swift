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
        center.addObserver(self, selector: #selector(showQuantities), name: .didAddBeverage, object: vendingMachine)
        center.addObserver(self, selector: #selector(showBalance), name: .didInsertMoney, object: vendingMachine)
        var token: NSObjectProtocol?
        token = center.addObserver(forName: .vendingMachineWillAppear, object: vendingMachine, queue: nil) { _ in
            self.showQuantities(); self.showBalance()
            center.removeObserver(token as Any, name: .vendingMachineWillAppear, object: self.vendingMachine) }
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

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        vendingMachine.add(beverage: beverage)
    }

    @IBAction func insertMoney(_ sender: UIButton) {
        guard let unit = Money.Unit(rawValue: sender.tag) else { return }
        guard vendingMachine?.insert(money: Money(unit: unit)) ?? false else { return }
    }

}
