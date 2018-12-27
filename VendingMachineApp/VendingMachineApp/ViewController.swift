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
    @IBOutlet var quantities: [UILabel]!
    @IBOutlet weak var balance: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        self.vendingMachine = VendingMachine(initialInventory: inventory)
        super.init(coder: aDecoder)
    }

    private func showQuantities() {
        for (index, quantity) in quantities.enumerated() {
            if let count = vendingMachine.count(beverage: index) {
                quantity.text = "\(count)개"
                continue
            }
            quantity.text = "0개"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine.add(beverage: Sprite())
        showQuantities()
        vendingMachine.showBalance(with: balanceForm(money:))
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private func insert(money: Int = 0) {
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

