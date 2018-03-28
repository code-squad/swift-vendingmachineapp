//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by YOUTH on 2018. 3. 20..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vending: VendingMachine!

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
        vending = VendingMachine.sharedVendingMachine()
        self.updateItemNumber()
        self.setBalance()
    }

    @IBAction func addButtonTouched(sender: UIButton) {
        guard let item = try? Controller.AdminController().addItem(sender.tag) else { return }
        vending.add(inputItem: item)
        self.updateItemNumber()
    }

    @IBAction func addBalance(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vending.addBalance(money: ValidMoney.thousand.cash)
        case 1:
            vending.addBalance(money: ValidMoney.fiveThousand.cash)
        default:
            vending.addBalance(money: ValidMoney.zero.cash)
        }
        self.setBalance()
    }

    private func updateItemNumber() {
        self.bananamilkStock.text = String(amountFormat: vending.howMany(of: BananaMilk()))
        self.chocomilkStock.text = String(amountFormat: vending.howMany(of: ChocoMilk()))
        self.coffeeStock.text = String(amountFormat: vending.howMany(of: Coffee()))
        self.dolcelatteStock.text = String(amountFormat: vending.howMany(of: DolceLatte()))
        self.energydrinkStock.text = String(amountFormat: vending.howMany(of: EnergyDrink()))
        self.softdrinkStock.text = String(amountFormat: vending.howMany(of: SoftDrink()))
    }

    private func setBalance() {
        self.balanceLabel.text = String(balanceFormat: vending.showBalance())
        self.balanceLabel.adjustsFontSizeToFitWidth = true
        self.balanceLabel.textAlignment = .center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

