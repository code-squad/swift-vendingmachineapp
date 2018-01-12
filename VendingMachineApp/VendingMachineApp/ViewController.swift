//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2017. 12. 28..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var admin: VendingMachineAdmin!
    private var user: VendingMachineUser!
    private var validate: Date!

    @IBOutlet var beverageCounts: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        admin = VendingMachineAdmin.init(vendingMachine: VendingMachine.sharedInstance())
        user = VendingMachineUser.init(vendingMachine: VendingMachine.sharedInstance())
        validate = Date.init(timeInterval: (Date.MilkExpirationInterval.twoWeek.value), since: Date())
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBeverageCounts(notification:)),
                                               name: .beverageCounts,
                                               object: VendingMachine.sharedInstance())
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeCoins(notification:)),
                                               name: .coins,
                                               object: VendingMachine.sharedInstance())
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePurchaseList(notification:)),
                                               name: .purchase,
                                               object: VendingMachine.sharedInstance())
        setVendingMachine()
    }

    @objc private func changeBeverageCounts(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Inventory] else { return }
        guard let inventory = userInfo["inventory"] else { return }
        refreshBeverageCount(inventory: inventory)
    }

    @objc private func changeCoins(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Int] else { return }
        guard let coins = userInfo["coins"] else { return }
        refreshCoins(coins: coins)
    }

    @objc private func changePurchaseList(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: String] else { return }
        guard let image = userInfo["image"] else { return }
        addImageForPurchaseList(image: image)
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
    }

    @IBAction func buyChocolateMilk(_ sender: Any) {
        buyBeverage(category: Milk.MilkCategory.chocolate.name)
    }

    @IBAction func buyBananaMilk(_ sender: Any) {
        buyBeverage(category: Milk.MilkCategory.banana.name)
    }

    @IBAction func buyStrawberryMilk(_ sender: Any) {
        buyBeverage(category: Milk.MilkCategory.strawberry.name)
    }

    @IBAction func buyGeorgia(_ sender: Any) {
        buyBeverage(category: Coffee.CoffeeCategory.georgia.name)
    }

    @IBAction func buyCantata(_ sender: Any) {
        buyBeverage(category: Coffee.CoffeeCategory.cantata.name)
    }

    @IBAction func buyTOPCoffee(_ sender: Any) {
        buyBeverage(category: Coffee.CoffeeCategory.topCoffee.name)
    }

    @IBAction func buySprite(_ sender: Any) {
        buyBeverage(category: Soda.SodaCategory.sprite.name)
    }

    @IBAction func buyFanta(_ sender: Any) {
        buyBeverage(category: Soda.SodaCategory.fanta.name)
    }

    @IBAction func buyPepsi(_ sender: Any) {
        buyBeverage(category: Soda.SodaCategory.pepsi.name)
    }

    private func buyBeverage(category: Category) {
        for product in user.getBuyableProducts() where product == category {
            user.buy(category: category)
        }
    }

    private func addImageForPurchaseList(image: String) {
        let purchaseListX: Int = 870
        let purchaseListY: Int = admin.getSalesHistory().count * 50 + 300
        let imageViewFrameWidth: Int = 150
        let imageViewFrameHeight: Int = 150
        let beverageImage = UIImageView(image: UIImage(named: "\(image)"))
        beverageImage.frame = CGRect(x: purchaseListX,
                                     y: purchaseListY,
                                     width: imageViewFrameWidth,
                                     height: imageViewFrameHeight)
        beverageImage.contentMode = .scaleAspectFit
        self.view.addSubview(beverageImage)
    }

    private func refreshBeverageCount(inventory: Inventory) {
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
    }

    private func refreshCoins(coins: Int) {
        balance.text = String(format: "잔액 : %6d 원", coins)
    }

}

extension Notification.Name {
    static let beverageCounts = Notification.Name("beverageCounts")
    static let coins = Notification.Name("coins")
    static let purchase = Notification.Name("purchase")
}
