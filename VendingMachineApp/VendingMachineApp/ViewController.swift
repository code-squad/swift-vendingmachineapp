//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by YOUTH on 2018. 3. 20..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vending = VendingMachine(stockItems: Controller().setVendingMachineStock(unit: 1))
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var moneyButtons: [UIButton]!
    @IBOutlet var addButtons: [UIButton]!

    @IBOutlet weak var bananaMilk: BeverageImageView!
    @IBOutlet weak var chocomilk: BeverageImageView!
    @IBOutlet weak var coffee: BeverageImageView!
    @IBOutlet weak var dolceLatte: BeverageImageView!
    @IBOutlet weak var energyDrink: BeverageImageView!
    @IBOutlet weak var softDrink: BeverageImageView!

    @IBOutlet weak var bananamilkStock: UILabel!
    @IBOutlet weak var chocomilkStock: UILabel!
    @IBOutlet weak var coffeeStock: UILabel!
    @IBOutlet weak var dolcelatteStock: UILabel!
    @IBOutlet weak var energydrinkStock: UILabel!
    @IBOutlet weak var softdrinkStock: UILabel!

    @IBAction func addButtonTouched(sender: UIButton) {
        switch sender.tag {
        case 0: vending.add(inputItem: BananaMilk())
        case 1: vending.add(inputItem: ChocoMilk())
        case 2: vending.add(inputItem: Coffee())
        case 3: vending.add(inputItem: DolceLatte())
        case 4: vending.add(inputItem: EnergyDrink())
        case 5: vending.add(inputItem: SoftDrink())
        default: break
        }
        self.updateItemNumber()
    }

    @IBAction func addBalance(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vending.addBalance(money: ValidMoney.thousand.cash)
        case 1:
            vending.addBalance(money: ValidMoney.fiveThousand.cash)
        default:
            vending.addBalance(money: 0)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        bananaMilk.image = UIImage(named: "bananamilk.jpg")
        chocomilk.image = UIImage(named: "chocomilk.jpg")
        coffee.image = UIImage(named: "top.jpg")
        dolceLatte.image = UIImage(named: "starbucks.jpg")
        energyDrink.image = UIImage(named: "redbull.jpg")
        softDrink.image = UIImage(named: "coke.jpg")
        self.updateItemNumber()
        self.setBalance()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

