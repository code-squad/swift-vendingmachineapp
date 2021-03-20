//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    private var vendingMachine = VendingMachine()
    
    @IBAction func insertCashOne(_ sender: Any) {
        vendingMachine.addCash(cash: 1000)
        updateTotalCash()
 
    private var skuStackView: SKUStackView!
    private var vendingMachine: VendingMachine!
    private var purchasedHistoryView: PurchasedHistoryView!
    private var purchaseButtonStackView: PurchaseButtonStackView!
    
    @IBAction func insertCashOne(_ sender: Any) {
        vendingMachine.addCash(cash: 1000)
    }
    
    @IBAction func insertCashFive(_ sender: Any) {
        vendingMachine.addCash(cash: 5000)
        updateTotalCash()
    }
    
    @IBOutlet weak var totalCash: UILabel!
    
    private func updateTotalCash() {
        totalCash.text = "\(vendingMachine.showAccount())"
    }
    
    private func addMainStackView() {
        let skuStackView = SKUStackView()
        let mainStackView = skuStackView.makeMainStackView()
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.vendingMachine
        addMainStackView()
        addPurchaseButtonView()
        addPurchasedHistoryView()
        updateCash()
        NotificationCenter.default.addObserver(self, selector: #selector(updateCash), name: VendingMachine.updateAccount, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateQuantity), name: VendingMachine.updateQuantity, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchasedHistory), name: VendingMachine.historyChanged, object: vendingMachine)
    }
    
    @objc func updateCash() {
        totalCash.text = "\(vendingMachine.showAccount())"
    }
    
    @objc func updateQuantity() {
        let quantity = vendingMachine.countQuantity()
        skuStackView.setQuantity(dict: quantity)
    }
    
    @objc func updatePurchasedHistory() {
        let purchased = vendingMachine.showHistory().last!
        let image = MatchingImage().matchImage(type: type(of: purchased))
        purchasedHistoryView.getImage(image: image)
    }
    
    @objc func addBeverage(_ sender: UIAddBeverageButtonView) {
        if let beverage = InstanceCreator.createInstance(sku: sender.beverageType) {
            vendingMachine.addBeverage(beverage: beverage)
        }
    }
    
    @objc func purchaseBeverage(_ sender: UIPurchaseButton) {
        if let beverage = InstanceCreator.createInstance(sku: sender.beverageType) {
            vendingMachine.sell(one: beverage)
            vendingMachine.remove(one: beverage)
        }
    }
    
}

extension ViewController {
    
    private func addMainStackView() {
        skuStackView = SKUStackView()
        let quantity = vendingMachine.countQuantity()
        skuStackView.setQuantity(dict: quantity)
        self.view.addSubview(skuStackView)
        skuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        skuStackView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
    }
    
    private func addPurchaseButtonView() {
        purchaseButtonStackView = PurchaseButtonStackView()
        let quantity = vendingMachine.countQuantity()
        skuStackView.setQuantity(dict: quantity)
        self.view.addSubview(purchaseButtonStackView)
        purchaseButtonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 312).isActive = true
        purchaseButtonStackView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
    }
    
    private func addPurchasedHistoryView() {
        purchasedHistoryView = PurchasedHistoryView()
        self.view.addSubview(purchasedHistoryView)
        purchasedHistoryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400).isActive = true
        purchasedHistoryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
        purchasedHistoryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        purchasedHistoryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150).isActive = true
    }

}


