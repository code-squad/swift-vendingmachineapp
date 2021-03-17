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
    
    var vendingMachine : VendingMachined!
    private var paymentMenu : PaymentMenu!
    private var drinkMenu : DrinkMenu!
    
    var scrollView : UIScrollView!
    var imagesStackView : UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkMenu = DrinkMenu(drinkButtons: addStockButton)
        paymentMenu = PaymentMenu(buttons: addPaymentButtons)
        changeBalanceLabel()
        changeBeverageLabel()
        setNotificationObserver()
        
        scrollView = UIScrollView(frame: CGRect(x: 40, y: 575, width: view.frame.width, height: 200))
        scrollView.backgroundColor = .systemTeal
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        view.addSubview(scrollView)
        
        scrollView.addSubview(imagesStackView)
        imagesStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        imagesStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        imagesStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imagesStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBalanceLabel(_:)), name: VendingMachine.updateBalance, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificationBeverageLabel(_:)), name: VendingMachine.updateBeverage, object: vendingMachine)
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: UIButton) {
        guard let beverageType = drinkMenu.add(button: sender) else { return }
        guard let beverageImage = drinkMenu.purchaseHistoryImage(button: sender) else { return }
        imagesStackView.addArrangedSubview(UIImageView(image: beverageImage))
        let beverage = BeverageFactory.make(beverageType)
        vendingMachine.addStock(beverage)
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: UIButton) {
        let money = paymentMenu.add(button : sender)
        vendingMachine.putPayMoney(money: money)
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text =
            String(vendingMachine.checkCurrentBalance())
    }
    
    private func changeBeverageLabel() {
        drinkMenu.drinkList.enumerated().forEach { index , drinkType in
            self.numberOfStock[index].text = String(vendingMachine.showBeverageStock(drinkType: drinkType))
        }
    }
    
    @objc private func updateNotificationBalanceLabel(_ notification : Notification) {
        self.BalanceLabel.text =
            String(notification.userInfo?["amountMoney"] as? Int ?? 0)
    }
    
    @objc private func updateNotificationBeverageLabel(_ notification : Notification) {
        drinkMenu.drinkList.enumerated().forEach { index, drinkType in
            let notification = notification.userInfo?["drinklist"] as? [ObjectIdentifier : [Beverage]]
            self.numberOfStock[index].text =
                String(notification?[ObjectIdentifier(drinkType)]?.count ?? 0)
        }
    }
    
}
