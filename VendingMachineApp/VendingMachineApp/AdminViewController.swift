//
//  ViewControllerForAdmin.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 15..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    private var admin: VendingMachineAdmin!
    private var validate: Date!

    @IBOutlet var beverageCounts: [UILabel]!
    private var beverageCountsText: [Category: UILabel] = [:]

    override func viewDidLoad() {
        admin = VendingMachineAdmin.init(vendingMachine: VendingMachine.sharedInstance())
        validate = Date.init(timeInterval: (Date.MilkExpirationInterval.twoWeek.value), since: Date())
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBeverageCounts(notification:)),
                                               name: .beverageCounts,
                                               object: VendingMachine.sharedInstance())
        initAdminVendingMachine()
    }

    @objc private func changeBeverageCounts(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let category = userInfo[Keyword.Key.category.value] as? Category else { return }
        guard let categoryCount = userInfo[Keyword.Key.categoryCount.value] as? Int else { return }
        refreshBeverageCount(category: category, categoryCount: categoryCount)
    }

    private func initAdminVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        beverageCountsText[Milk.MilkCategory.chocolate.name] = beverageCounts[0]
        beverageCountsText[Milk.MilkCategory.banana.name] = beverageCounts[1]
        beverageCountsText[Milk.MilkCategory.strawberry.name] = beverageCounts[2]
        beverageCountsText[Coffee.CoffeeCategory.georgia.name] = beverageCounts[3]
        beverageCountsText[Coffee.CoffeeCategory.cantata.name] = beverageCounts[4]
        beverageCountsText[Coffee.CoffeeCategory.topCoffee.name] = beverageCounts[5]
        beverageCountsText[Soda.SodaCategory.sprite.name] = beverageCounts[6]
        beverageCountsText[Soda.SodaCategory.fanta.name] = beverageCounts[7]
        beverageCountsText[Soda.SodaCategory.pepsi.name] = beverageCounts[8]
        admin.getInventory().forEach { key, value in
            beverageCountsText[key]?.text = "\(value.count) 개"
        }
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
    }

    private func refreshBeverageCount(category: Category, categoryCount: Int) {
        beverageCountsText[category]?.text = "\(categoryCount) 개"
    }

    @IBAction func closeAdminMode(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
