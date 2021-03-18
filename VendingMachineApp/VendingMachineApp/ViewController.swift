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
    
    private var vendingMachine : UserModable!
    private var paymentMenu : PaymentMenu!
    private var drinkMenu : BeverageMapper!
    private var purchaseMenu : BeverageMapper!
    
    private let drinkImages = [#imageLiteral(resourceName: "StrawberryMilk"),#imageLiteral(resourceName: "DietCola"),#imageLiteral(resourceName: "TopAmericano")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkMenu = BeverageMapper(drinkButtons: addStockButton)
        purchaseMenu = BeverageMapper(drinkButtons: PurchaseButtons)
        paymentMenu = PaymentMenu(buttons: addPaymentButtons)
        changeBalanceLabel()
        changeBeverageLabel()
        changePurchaseScrollView()
        setNotificationObserver()
    }
    
    func setVendingMachine(_ vendingMachined : UserModable){
        self.vendingMachine = vendingMachined
    }
    
    private func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: VendingMachine.NotificationName.updateBalance, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.NotificationName.updateBeverage, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchaseImage(_:)), name: VendingMachine.NotificationName.updatePurchase, object: vendingMachine)
    }
    
    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        guard let beverageType = drinkMenu[sender] else { return }
        let beverage = BeverageFactory.make(beverageType)
        vendingMachine.addStock(beverage)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        let money = paymentMenu[sender]
        vendingMachine.putPayMoney(money: money)
    }
    
    @IBAction func purchaseButtonTouched(_ sender: UIButton) {
        guard let beverageType = purchaseMenu[sender] else { return }
        vendingMachine.purchaseBeverage(beverageType: beverageType)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(vendingMachine.checkCurrentBalance())
    }
    
    private func changeBeverageLabel() {
        BeverageMapper.drinkTypeList.enumerated().forEach { index , drinkType in
            self.numberOfStock[index].text = String(vendingMachine.showBeverageStock(drinkType: drinkType))
        }
    }
    
    private func changePurchaseScrollView() {
        vendingMachine.purchaseHistory().forEach { (beverage) in
            makeBeverageImage(beverage: beverage)
        }
    }
    
    private func makeBeverageImage(beverage : Beverage) {
        guard let card = BeverageImageFactory.make(type(of: beverage.self)) else { return }
        updatePurchaseScrollImages(card: card)
    }
    
    private func updatePurchaseScrollImages(card : UIImage) {
        let imageView = UIImageView(image: card)
        imageView.frame = CGRect(x: scrollView.contentSize.width, y: scrollView.bounds.origin.y, width: 200, height: 200)
        scrollView.addSubview(imageView)
        scrollView.contentSize.width += 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adminViewcontroller = segue.destination as? VendingMachinedable else { return }
        adminViewcontroller.setVendingMachine(vendingMachine)
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        changeBalanceLabel()
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        changeBeverageLabel()
    }
    
    @objc private func updatePurchaseImage(_ notification : Notification) {
        guard let beverage = notification.userInfo?["beverage"] as? Beverage else { return }
        makeBeverageImage(beverage: beverage)
    }
    
}
