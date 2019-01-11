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
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    required init?(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine.shared
        super.init(coder: aDecoder)
    }

    private func roundImageViews() {
        for image in beverageImages {
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
        }
    }

    private func registerAsObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(showQuantities),
            name: .didAddBeverage, object: vendingMachine)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageViews()
        showQuantities()
        vendingMachine?.showBalance(with: balanceForm)
        registerAsObserver()
    }

    @objc private func showQuantities() {
        for (index, quantity) in beverageLabels.enumerated() {
            let count =  vendingMachine?.count(beverage: index)
            quantity.text = "\(count ?? 0)개"
        }
    }

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        vendingMachine.add(beverage: beverage)
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private func insert(money: Money) {
        guard vendingMachine?.insert(money: money) ?? false else { return }
        vendingMachine?.showBalance(with: balanceForm)
    }

    @IBAction func insertOneThousand(_ sender: Any) {
        insert(money: Money(unit: .oneThousand))
    }

    @IBAction func insertFiveThousands(_ sender: Any) {
        insert(money: Money(unit: .fiveThousands))
    }

}

