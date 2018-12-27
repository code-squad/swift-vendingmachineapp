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
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    required init?(coder aDecoder: NSCoder) {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        self.vendingMachine = VendingMachine(initialInventory: inventory)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showQuantities()
        vendingMachine.showBalance(with: balanceForm(money:))
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
        let selected = sender.tag
        guard vendingMachine.add(beverage: selected) else { return }
        showQuantities()
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private func insert(money: Int) {
        guard vendingMachine.insert(money: money) else { return }
        vendingMachine.showBalance(with: balanceForm(money:))
    }

    @IBAction func insertOneThousand(_ sender: Any) {
        insert(money: 1000)
    }

    @IBAction func insertFiveThousands(_ sender: Any) {
        insert(money: 5000)
    }

}

