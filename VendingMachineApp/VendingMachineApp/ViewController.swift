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

    @IBOutlet weak var chocolateMilkCount: UILabel!
    @IBOutlet weak var bananaMilkCount: UILabel!
    @IBOutlet weak var strawberryMilkCount: UILabel!
    @IBOutlet weak var georgiaCount: UILabel!
    @IBOutlet weak var cantataCount: UILabel!
    @IBOutlet weak var topCoffeeCount: UILabel!
    @IBOutlet weak var spriteCount: UILabel!
    @IBOutlet weak var fantaCount: UILabel!
    @IBOutlet weak var pepsiCount: UILabel!

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
        chocolateMilkCount.text = "0 개"
        bananaMilkCount.text = "0 개"
        strawberryMilkCount.text = "0 개"
        georgiaCount.text = "0 개"
        cantataCount.text = "0 개"
        topCoffeeCount.text = "0 개"
        spriteCount.text = "0 개"
        fantaCount.text = "0 개"
        pepsiCount.text = "0 개"
        balance.text = String(format: "잔액 : %6d 원", 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addChocolateMilk(_ sender: Any) {
        let chocolateMilk = ChocolateMilk.init(brand: "서울우유", weight: 200, price: 1000,
                                               name: "초코우유", dateOfManufacture: dateOfManufacture, validate: validate)
        admin.add(product: chocolateMilk)
        refreshBeverageCount()
    }

    @IBAction func addBananaMilk(_ sender: Any) {
        let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000,
                                         name: "날마다바나나우유", dateOfManufacture: dateOfManufacture, validate: validate)
        admin.add(product: bananaMilk)
        refreshBeverageCount()
    }

    @IBAction func addStrawberryMilk(_ sender: Any) {
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000,
                                                 name: "날마다딸기우유",
                                                 dateOfManufacture: dateOfManufacture,
                                                 validate: validate)
        admin.add(product: strawberryMilk)
        refreshBeverageCount()
    }

    @IBAction func addGeorgia(_ sender: Any) {
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000,
                                   name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        admin.add(product: georgia)
        refreshBeverageCount()
    }

    @IBAction func addCantata(_ sender: Any) {
        let cantata = Cantata.init(brand: "Cantata", weight: 400, price: 3000,
                                   name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        admin.add(product: cantata)
        refreshBeverageCount()
    }

    @IBAction func addTOPCoffee(_ sender: Any) {
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000,
                                       name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        admin.add(product: topCoffee)
        refreshBeverageCount()
    }

    @IBAction func addSprite(_ sender: Any) {
        let sprite = Sprite.init(brand: "코카콜라", weight: 350, price: 2000,
                                 name: "스프라이트", dateOfManufacture: dateOfManufacture, lowCalorie: false)
        admin.add(product: sprite)
        refreshBeverageCount()
    }

    @IBAction func addFanta(_ sender: Any) {
        let fanta = Fanta.init(brand: "코카콜라", weight: 350, price: 2000,
                               name: "환타", dateOfManufacture: dateOfManufacture, lowCalorie: false)
        admin.add(product: fanta)
        refreshBeverageCount()
    }

    @IBAction func addPepsi(_ sender: Any) {
        let pepsiCoke = PepsiCoke.init(brand: "펩시", weight: 350, price: 2000,
                                       name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        admin.add(product: pepsiCoke)
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
            chocolateMilkCount.text = "\(value.count) 개"
        case "바나나우유":
            bananaMilkCount.text = "\(value.count) 개"
        case "딸기우유":
            strawberryMilkCount.text = "\(value.count) 개"
        case "죠지아커피":
            georgiaCount.text = "\(value.count) 개"
        case "칸타타커피":
            cantataCount.text = "\(value.count) 개"
        case "TOP커피":
            topCoffeeCount.text = "\(value.count) 개"
        case "사이다":
            spriteCount.text = "\(value.count) 개"
        case "환타":
            fantaCount.text = "\(value.count) 개"
        case "펩시콜라":
            pepsiCount.text = "\(value.count) 개"
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
