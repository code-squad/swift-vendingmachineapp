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

    @IBOutlet var beverageCounts: [UILabel]!
    private var sortedBeverageCounts: [Beverage: UILabel] = [:]
    private var sortedBeverages: [Beverage] = []

    @IBOutlet weak var pieGraphView: PieGraphView!

    override func viewDidLoad() {
        admin = VendingMachineAdmin.init(vendingMachine: VendingMachine.sharedInstance())
        sortedBeverages = BeverageFactory.createBeverageAll()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBeverageCounts(notification:)),
                                               name: .beverageCounts,
                                               object: VendingMachine.sharedInstance())
        initAdminVendingMachine()
    }

    override func viewWillAppear(_ animated: Bool) {
        pieGraphView.purchaseList = admin.getSalesHistory()
    }

    @objc private func changeBeverageCounts(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let product = userInfo[Keyword.Key.product.value] as? Beverage else { return }
        guard let productCount = userInfo[Keyword.Key.productCount.value] as? Int else { return }
        refreshBeverageCount(product: product, productCount: productCount)
    }

    private func initAdminVendingMachine() {
        beverageCounts.forEach { $0.text = "0 개" }
        for i in 0..<sortedBeverages.count {
            sortedBeverageCounts[sortedBeverages[i]] = beverageCounts[i]
        }
        admin.getInventory().forEach { key, value in
            sortedBeverageCounts[key]?.text = "\(value.count) 개"
        }
    }

    @IBAction func addChocolateMilk(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.chocoMilk)
    }

    @IBAction func addBananaMilk(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.bananaMilk)
    }

    @IBAction func addStrawberryMilk(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.strawberryMilk)
    }

    @IBAction func addGeorgia(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.georgia)
    }

    @IBAction func addCantata(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.cantata)
    }

    @IBAction func addTOPCoffee(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.topCoffee)
    }

    @IBAction func addSprite(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.sprite)
    }

    @IBAction func addFanta(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.fanta)
    }

    @IBAction func addPepsi(_ sender: Any) {
        addProduct(taste: BeverageFactory.Taste.pepsi)
    }

    private func addProduct(taste: BeverageFactory.Taste) {
        admin.add(product: BeverageFactory.createBeverage(taste: taste))
    }

    private func refreshBeverageCount(product: Beverage, productCount: Int) {
        sortedBeverageCounts[product]?.text = "\(productCount) 개"
    }

    @IBAction func closeAdminMode(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
