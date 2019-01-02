//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    required init?(coder aDecoder: NSCoder) {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        self.vendingMachine = VendingMachine(initialInventory: inventory)
        super.init(coder: aDecoder)
    }

    private func roundImageViews() {
        for image in beverageImages {
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageViews()
        showQuantities()
        vendingMachine.showBalance(with: balanceForm)
    }

    private func showQuantities() {
        for (index, quantity) in beverageLabels.enumerated() {
            if let count = vendingMachine.count(beverage: index) {
                quantity.text = "\(count)개"
                continue
            }
            quantity.text = "0개"
        }
    }

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard vendingMachine.add(beverage: beverage) else { return }
        showQuantities()
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private enum Money: Int {
        case oneThousand = 1000
        case fiveThousands = 5000
    }

    private func insert(money: Money) {
        guard vendingMachine.insert(money: money.rawValue) else { return }
        vendingMachine.showBalance(with: balanceForm)
    }

    @IBAction func insertOneThousand(_ sender: Any) {
        insert(money: .oneThousand)
    }

    @IBAction func insertFiveThousands(_ sender: Any) {
        insert(money: .fiveThousands)
    }

}

