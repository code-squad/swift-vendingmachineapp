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
        case "초코우유":
            beverageCounts[0].text = "\(value.count) 개"
        case "바나나우유":
            beverageCounts[1].text = "\(value.count) 개"
        case "딸기우유":
            beverageCounts[2].text = "\(value.count) 개"
        case "죠지아커피":
            beverageCounts[3].text = "\(value.count) 개"
        case "칸타타커피":
            beverageCounts[4].text = "\(value.count) 개"
        case "TOP커피":
            beverageCounts[5].text = "\(value.count) 개"
        case "사이다":
            beverageCounts[6].text = "\(value.count) 개"
        case "환타":
            beverageCounts[7].text = "\(value.count) 개"
        case "펩시콜라":
            beverageCounts[8].text = "\(value.count) 개"
        default:
            return
        }
    }

    @IBAction func insert1000Coins(_ sender: Any) {
        user.insertCoins(1000)
        balance.text = String(format: "잔액 : %6d 원", user.getBalance())
    }

    @IBAction func insert5000coins(_ sender: Any) {
        user.insertCoins(5000)
        balance.text = String(format: "잔액 : %6d 원", user.getBalance())
    }

}
