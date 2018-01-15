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
    private var sortedBeverageCounts: [Category: UILabel] = [:]
    private var sortedBeverageCategory: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        user = VendingMachineUser.init(vendingMachine: VendingMachine.sharedInstance())
        sortedBeverageCategory.append(contentsOf: Milk.getCategoryAll)
        sortedBeverageCategory.append(contentsOf: Coffee.getCategoryAll)
        sortedBeverageCategory.append(contentsOf: Soda.getCategoryAll)
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
        initVendingMachine()
    }

    @objc private func changeBeverageCounts(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let category = userInfo[Keyword.Key.category.value] as? Category else { return }
        guard let categoryCount = userInfo[Keyword.Key.categoryCount.value] as? Int else { return }
        refreshBeverageCount(category: category, categoryCount: categoryCount)
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

    private func initVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        balance.text = String(format: "잔액 : %6d 원", 0)
        for i in 0..<sortedBeverageCategory.count {
            sortedBeverageCounts[sortedBeverageCategory[i]] = beverageCounts[i]
        }
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

    private func refreshBeverageCount(category: Category, categoryCount: Int) {
        sortedBeverageCounts[category]?.text = "\(categoryCount) 개"
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
