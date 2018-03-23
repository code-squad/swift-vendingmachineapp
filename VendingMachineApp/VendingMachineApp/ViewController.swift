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

    @IBOutlet weak var bananaMilkButton: UIButton!
    @IBOutlet weak var chocoMilkButton: UIButton!
    @IBOutlet weak var coffeeButton: UIButton!
    @IBOutlet weak var dolceLatteButton: UIButton!
    @IBOutlet weak var energyDrinkButton: UIButton!
    @IBOutlet weak var softDrinkButton: UIButton!

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

    @IBAction func bananaMilkTouched(sender: UIButton) {
        vending.add(inputItem: BananaMilk())
        self.updateItemNumber()
    }
    @IBAction func chocoMilkTouched(sender: UIButton) {
        vending.add(inputItem: ChocoMilk())
        self.updateItemNumber()
    }
    @IBAction func coffeeTouched(sender: UIButton) {
        vending.add(inputItem: Coffee())
        self.updateItemNumber()
    }
    @IBAction func dolceLatteTouched(sender: UIButton) {
        vending.add(inputItem: DolceLatte())
        self.updateItemNumber()
    }
    @IBAction func energyDrinkTouched(sender: UIButton) {
        vending.add(inputItem: EnergyDrink())
        self.updateItemNumber()
    }
    @IBAction func softDrinkTouched(sender: UIButton) {
        vending.add(inputItem: SoftDrink())
        self.updateItemNumber()
    }

    @IBAction func addBalance(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vending.addBalance(money: 1000)
        case 1:
            vending.addBalance(money: 5000)
        default:
            vending.addBalance(money: 0)
        }
        self.setBalance()
    }


    private func updateItemNumber() {
        self.bananamilkStock.text = "\(vending.howMany(of: BananaMilk()))개"
        self.chocomilkStock.text = "\(vending.howMany(of: ChocoMilk()))개"
        self.coffeeStock.text = "\(vending.howMany(of: Coffee()))개"
        self.dolcelatteStock.text = "\(vending.howMany(of: DolceLatte()))개"
        self.energydrinkStock.text = "\(vending.howMany(of: EnergyDrink()))개"
        self.softdrinkStock.text = "\(vending.howMany(of: SoftDrink()))개"
    }

    private func setBalance() {
        self.balanceLabel.text = "\(vending.showBalance())원"
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

