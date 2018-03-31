//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by YOUTH on 2018. 3. 20..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vending: DefaultMode?
    var boughtItems : [Beverage]?

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var moneyButtons: [UIButton]!
    @IBOutlet weak var bananamilkStock: UILabel!
    @IBOutlet weak var chocomilkStock: UILabel!
    @IBOutlet weak var coffeeStock: UILabel!
    @IBOutlet weak var dolcelatteStock: UILabel!
    @IBOutlet weak var energydrinkStock: UILabel!
    @IBOutlet weak var softdrinkStock: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.vending != nil {
            self.updateItemNumber()
            self.setBalance()
            NotificationCenter.default.addObserver(self, selector: #selector(didChangedBalance), name: .changedBalance, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(didChangeItemNumber(_:)), name: .changedItemNumber, object: nil)
        } else {
            self.vending = VendingMachine(stockItems: AdminController().setVendingMachineStock(unit: 1))
        }
    }

    @objc private func didChangeItemNumber(_ notification: Notification) {
        self.updateItemNumber()
    }

    @objc private func didChangedBalance(_ notification: Notification) {
        self.setBalance()
    }

    @IBAction func addButtonTouched(sender: UIButton) {
        guard let item = try? AdminController().pickItem(sender.tag) else { return }
        vending?.add(inputItem: item)
    }

    @IBAction func buyButtonTouched(_ sender: UIButton) {
        guard let item = try? vending!.buy(itemCode: sender.tag) else { return }
        if item != nil {
            boughtItems?.append(item)
        } else {
            return
        }
    }

    @IBAction func addBalance(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vending?.addBalance(money: ValidMoney.thousand.cash)
        case 1:
            vending?.addBalance(money: ValidMoney.fiveThousand.cash)
        default:
            vending?.addBalance(money: ValidMoney.zero.cash)
        }
    }

    private func updateItemNumber() {
        guard let vending = self.vending else { return }
        self.bananamilkStock.text = String(amountFormat: vending.howMany(of: BananaMilk()))
        self.chocomilkStock.text = String(amountFormat: vending.howMany(of: ChocoMilk()))
        self.coffeeStock.text = String(amountFormat: vending.howMany(of: Coffee()))
        self.dolcelatteStock.text = String(amountFormat: vending.howMany(of: DolceLatte()))
        self.energydrinkStock.text = String(amountFormat: vending.howMany(of: EnergyDrink()))
        self.softdrinkStock.text = String(amountFormat: vending.howMany(of: SoftDrink()))
    }

    private func setBalance() {
        guard let balance = vending?.showBalance else { return }
        self.balanceLabel.text = String(balanceFormat: balance())
        self.balanceLabel.adjustsFontSizeToFitWidth = true
        self.balanceLabel.textAlignment = .center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

