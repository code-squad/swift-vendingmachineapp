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
    private var sortedBeverageCounts: [Beverage: UILabel] = [:]
    private var sortedBeverages: [Beverage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        user = VendingMachineUser.init(vendingMachine: VendingMachine.sharedInstance())
        sortedBeverages = BeverageFactory.createBeverageAll()
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

    private func initVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        balance.text = String(format: "잔액 : %6d 원", 0)
        for i in 0..<sortedBeverages.count {
            sortedBeverageCounts[sortedBeverages[i]] = beverageCounts[i]
        }
    }

    @objc private func changeBeverageCounts(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let product = userInfo[Keyword.Key.product.value] as? Beverage else { return }
        guard let productCount = userInfo[Keyword.Key.productCount.value] as? Int else { return }
        refreshBeverageCount(product: product, productCount: productCount)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyChocolateMilk(_ sender: Any) {
        buyBeverage(name: Milk.MilkCategory.chocolate.name)
    }

    @IBAction func buyBananaMilk(_ sender: Any) {
        buyBeverage(name: Milk.MilkCategory.banana.name)
    }

    @IBAction func buyStrawberryMilk(_ sender: Any) {
        buyBeverage(name: Milk.MilkCategory.strawberry.name)
    }

    @IBAction func buyGeorgia(_ sender: Any) {
        buyBeverage(name: Coffee.CoffeeCategory.georgia.name)
    }

    @IBAction func buyCantata(_ sender: Any) {
        buyBeverage(name: Coffee.CoffeeCategory.cantata.name)
    }

    @IBAction func buyTOPCoffee(_ sender: Any) {
        buyBeverage(name: Coffee.CoffeeCategory.topCoffee.name)
    }

    @IBAction func buySprite(_ sender: Any) {
        buyBeverage(name: Soda.SodaCategory.sprite.name)
    }

    @IBAction func buyFanta(_ sender: Any) {
        buyBeverage(name: Soda.SodaCategory.fanta.name)
    }

    @IBAction func buyPepsi(_ sender: Any) {
        buyBeverage(name: Soda.SodaCategory.pepsi.name)
    }

    private func buyBeverage(name: String) {
        for product in user.getBuyableProducts() where product.name == name {
            user.buy(product: product)
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

    private func refreshBeverageCount(product: Beverage, productCount: Int) {
        sortedBeverageCounts[product]?.text = "\(productCount) 개"
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
