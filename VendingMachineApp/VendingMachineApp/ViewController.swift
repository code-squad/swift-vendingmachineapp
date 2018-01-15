//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2017. 12. 28..
//  Copyright © 2017년 ChocOZerO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var user: VendingMachineUser!

    @IBOutlet var beverageCounts: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        user = VendingMachineUser.init(vendingMachine: VendingMachine.sharedInstance())
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
        guard let inventory = userInfo[Keyword.Key.inventory.value] else { return }
        refreshBeverageCount(inventory: inventory)
    }

    @objc private func changeCoins(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Int] else { return }
        guard let coins = userInfo[Keyword.Key.coins.value] else { return }
        refreshCoins(coins: coins)
    }

    @objc private func changePurchaseList(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let image = userInfo[Keyword.Key.image.value] as? String else { return }
        guard let count = userInfo[Keyword.Key.purchaseListCount.value] as? Int else { return }
        addImageForPurchaseList(image: image, count: count)
    }

    private func setVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        balance.text = String(format: "잔액 : %6d 원", 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    private func addImageForPurchaseList(image: String, count: Int) {
        let purchaseListX: Int = 875
        let purchaseListY: Int = count * 50 + 260
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
