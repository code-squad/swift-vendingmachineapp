//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController ,VendingMachinedable {
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet var addPaymentButtons: [UIButton]!
    @IBOutlet weak var BalanceLabel: UILabel!
    @IBOutlet var PurchaseButtons: [UIButton]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var vendingMachine : VendingMachined!
    private var paymentMenu : PaymentMenu!
    private var drinkMenu : Mapper!
    private var purchaseMenu : Mapper!
    
    private let drinkTypeList = [StrawberryMilk.self, DietCola.self, TopAmericano.self]
    private let drinkImages = [#imageLiteral(resourceName: "StrawberryMilk"),#imageLiteral(resourceName: "DietCola"),#imageLiteral(resourceName: "TopAmericano")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkMenu = Mapper(drinkButtons: addStockButton, drinkTypeList: drinkTypeList)
        purchaseMenu = Mapper(drinkButtons: PurchaseButtons, drinkTypeList: drinkTypeList)
        paymentMenu = PaymentMenu(buttons: addPaymentButtons)
        changeBalanceLabel()
        changeBeverageLabel()
        changePurchaseScrollView()
        setNotificationObserver()
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: VendingMachine.updateBalance, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.updateBeverage, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchaseImage(_:)), name: VendingMachine.updatePurchase, object: vendingMachine)
    }
    
    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        guard let beverageType = drinkMenu.mapping(button: sender) else { return }
        let beverage = BeverageFactory.make(beverageType)
        vendingMachine.addStock(beverage)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        let money = paymentMenu.add(button : sender)
        vendingMachine.putPayMoney(money: money)
    }
    
    @IBAction func purchaseButtonTouched(_ sender: UIButton) {
        guard let beverageType = purchaseMenu.mapping(button: sender) else { return }
        vendingMachine.purchaseBeverage(beverageType: beverageType)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(vendingMachine.checkCurrentBalance())
    }
    
    private func changeBeverageLabel() {
        drinkTypeList.enumerated().forEach { index , drinkType in
            self.numberOfStock[index].text = String(vendingMachine.showBeverageStock(drinkType: drinkType))
        }
    }
    
    private func changePurchaseScrollView() {
        vendingMachine.purchaseHistory().forEach { (beverage) in
            guard let card = BeverageFactory.makeImage(type(of: beverage.self)) else { return }
            updatePurchaseScrollImages(card: card)
        }
    }
    
    private func updatePurchaseScrollImages(card : UIImage) {
        let imageView = UIImageView(image: card)
        imageView.frame = CGRect(x: scrollView.contentSize.width, y: scrollView.bounds.origin.y, width: 200, height: 200)
        scrollView.addSubview(imageView)
        scrollView.contentSize.width += 150
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        drinkTypeList.enumerated().forEach { index, drinkType in
            let notification = notification.userInfo?["drinklist"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[index].text =
                String(notification?[ObjectIdentifier(drinkType)]?.count ?? 0)
        }
    }
    
    @objc private func updatePurchaseImage(_ notification : Notification) {
        guard let beverageType = notification.userInfo?["beverageType"] as? Beverage.Type else { return }
        guard let card = BeverageFactory.makeImage(beverageType) else { return }
        updatePurchaseScrollImages(card: card)
    }
    
}
