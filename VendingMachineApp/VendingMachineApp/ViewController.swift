//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2017. 12. 28..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let vendingMachine = VendingMachine()
    private var admin: VendingMachineAdmin!
    private var user: VendingMachineUser!
    private var dateOfManufacture: Date!
    private var validate: Date!

    @IBOutlet var beverageCounts: [UILabel]!

    @IBOutlet weak var balance: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfManufacture = Date()
        validate = Date.init(timeInterval: (60.0 * 60 * 24 * 14), since: dateOfManufacture)
        admin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
        user = VendingMachineUser.init(vendingMachine: vendingMachine)
        setVendingMachine()
    }

    private func setVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        balance.text = String(format: "잔액 : %6d 원", 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addChocolateMilk(_ sender: Any) {
        let chocolateMilk = ChocolateMilk.init(validate: validate)
        addProduct(chocolateMilk)
    }

    @IBAction func addBananaMilk(_ sender: Any) {
        let bananaMilk = BananaMilk.init(validate: validate)
        addProduct(bananaMilk)
    }

    @IBAction func addStrawberryMilk(_ sender: Any) {
        let strawberryMilk = StrawberryMilk.init(validate: validate)
        addProduct(strawberryMilk)
    }

    @IBAction func addGeorgia(_ sender: Any) {
        let georgia = Georgia.init(hot: false)
        addProduct(georgia)
    }

    @IBAction func addCantata(_ sender: Any) {
        let cantata = Cantata.init(hot: true)
        addProduct(cantata)
    }

    @IBAction func addTOPCoffee(_ sender: Any) {
        let topCoffee = TOPCoffee.init(hot: true)
        addProduct(topCoffee)
    }

    @IBAction func addSprite(_ sender: Any) {
        let sprite = Sprite.init(lowCalorie: false)
        addProduct(sprite)
    }

    @IBAction func addFanta(_ sender: Any) {
        let fanta = Fanta.init(lowCalorie: false)
        addProduct(fanta)
    }

    @IBAction func addPepsi(_ sender: Any) {
        let pepsiCoke = PepsiCoke.init(lowCalorie: true)
        addProduct(pepsiCoke)
    }

    private func addProduct(_ product: Beverage) {
        admin.add(product: product)
        refreshBeverageCount()
    }

    private func refreshBeverageCount() {
        let inventory: Inventory = admin.getInventory()
        for (key, value) in inventory {
            setBeverageCountLabel(key, value)
        }
    }

    private func setBeverageCountLabel(_ key: Category, _ value: Products) {
        switch key {
        case Milk.MilkCategory.chocolate.name:
            beverageCounts[0].text = "\(value.count) 개"
        case Milk.MilkCategory.banana.name:
            beverageCounts[1].text = "\(value.count) 개"
        case Milk.MilkCategory.strawberry.name:
            beverageCounts[2].text = "\(value.count) 개"
        case Coffee.CoffeeCategory.georgia.name:
            beverageCounts[3].text = "\(value.count) 개"
        case Coffee.CoffeeCategory.cantata.name:
            beverageCounts[4].text = "\(value.count) 개"
        case Coffee.CoffeeCategory.topCoffee.name:
            beverageCounts[5].text = "\(value.count) 개"
        case Soda.SodaCategory.sprite.name:
            beverageCounts[6].text = "\(value.count) 개"
        case Soda.SodaCategory.fanta.name:
            beverageCounts[7].text = "\(value.count) 개"
        case Soda.SodaCategory.pepsi.name:
            beverageCounts[8].text = "\(value.count) 개"
        default:
            return
        }
    }

    @IBAction func insertCoins(_ sender: UIButton) {
        switch sender.tag {
        case Coins.thousand.value:
            user.insertCoins(Coins.thousand.value)
        case Coins.fiveThousand.value:
            user.insertCoins(Coins.fiveThousand.value)
        default:
            return
        }
        balance.text = String(format: "잔액 : %6d 원", user.getBalance())
    }

}
