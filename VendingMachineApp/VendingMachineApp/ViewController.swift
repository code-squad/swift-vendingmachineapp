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

    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var beverageLabels: [UILabel]!

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
    }
    @IBAction func chocoMilkTouched(sender: UIButton) {
        vending.add(inputItem: ChocoMilk())
    }
    @IBAction func coffeeTouched(sender: UIButton) {
        vending.add(inputItem: Coffee())
    }
    @IBAction func dolceLatteTouched(sender: UIButton) {
        vending.add(inputItem: DolceLatte())
    }
    @IBAction func energyDrinkTouched(sender: UIButton) {
        vending.add(inputItem: EnergyDrink())
    }
    @IBAction func softDrinkTouched(sender: UIButton) {
        vending.add(inputItem: SoftDrink())
    }

    func updateItemNumber() {
        self.bananamilkStock.text = "\(vending.howMany(of: BananaMilk()))개"
        self.chocomilkStock.text = "\(vending.howMany(of: ChocoMilk()))개"
        self.coffeeStock.text = "\(vending.howMany(of: Coffee()))개"
        self.dolcelatteStock.text = "\(vending.howMany(of: DolceLatte()))개"
        self.energydrinkStock.text = "\(vending.howMany(of: EnergyDrink()))개"
        self.softdrinkStock.text = "\(vending.howMany(of: SoftDrink()))개"
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

