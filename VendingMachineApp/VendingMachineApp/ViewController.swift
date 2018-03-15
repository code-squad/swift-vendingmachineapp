//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine : BaseMode?
    
    @IBOutlet var products: [UIImageView]!
    @IBOutlet var labelOfProducts: [UILabel]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet var addInventory: [UIButton]!
    @IBOutlet var addMoney: [UIButton]!
    @IBOutlet var buyProduct: [UIButton]!
    @IBOutlet weak var listOfPurchase: UILabel!
    private var ButtonsByProduct : [UIButton:Beverage] = [:]
    private var imageViewMaker : ImageViewMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let vendingMachine = self.vendingMachine else { return }
        imageViewMaker = ImageViewMaker()
        setButtonsByProduct()
        updateBalance(vendingMachine.getBalance())
        updateInventory()
        updateListOfPurchase()
        NotificationCenter.default.addObserver(self, selector: #selector(updateInventoryLabels(notification:)), name: .didUpdateInventory , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(notification:)), name: .didUpdateBalance , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateListOfPurchase(notification:)), name: .didUpdateListOfPurchase , object: nil)
    }
    
    @IBAction func addInventoryButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.vendingMachine else { return }
        guard let productByTouch = ButtonsByProduct[addInventory[sender.tag]] else { return }
        vendingMachine.addBeverage(productByTouch)
    }
    
    @IBAction func buyProductButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.vendingMachine else { return }
        guard let productByTouch = ButtonsByProduct[addInventory[sender.tag]] else { return }
        vendingMachine.buy(productByTouch)
    }
    
    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.vendingMachine else { return }
        switch sender.tag {
        case 0: vendingMachine.addMoney(.oneThousand)
        case 1: vendingMachine.addMoney(.fiveThousands)
        default:
            return
        }
    }
    
    @objc private func updateInventoryLabels(notification : Notification) {
        updateInventory()
    }
    
    @objc private func updateBalanceLabel(notification : Notification) {
        guard let userInfo = notification.userInfo as? [String : Int] else { return }
        guard let insertedMoney = userInfo[Keyword.Key.balance.rawValue] else { return }
        updateBalance(insertedMoney)
    }
    
    @objc private func updateListOfPurchase(notification : Notification) {
        updateListOfPurchase()
    }
    
    private func updateListOfPurchase() {
        guard let productsSold = vendingMachine?.generateListOfHistory() else { return }
        for oneImageView in imageViewMaker.generateImageViewOfPurchase(productsSold) {
            self.view.addSubview(oneImageView)
        }
    }
    
    private func updateBalance(_ insertedMoney : Int) {
        balance.text = insertedMoney.formatMoney()
    }
    
    private func updateInventory() {
        guard let vendingMachine = self.vendingMachine else { return }
        var inventoryIndex = 0
        for countOfOneProduct in vendingMachine.generateCountOfProduct() {
            labelOfProducts[inventoryIndex].text = countOfOneProduct.formatCount()
            inventoryIndex += 1
        }
    }
    
    private func setButtonsByProduct() {
        guard let vendingMachine = self.vendingMachine else { return }
        vendingMachine.updateProductNumbersAndKinds()
        var productNumbersAndKind = vendingMachine.getProductNumbersAndKind()
        for index in 0..<addInventory.count {
            guard let oneProduct = vendingMachine.generateBeverageFromProductName(productNumbersAndKind[index] ?? ObjectIdentifier(Beverage.self)) else { return }
            ButtonsByProduct.updateValue(oneProduct, forKey: addInventory[index])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension Int {
    func formatCount() -> String {
        return String(format : "%2d개", self)
    }
    
    func formatMoney() -> String {
        return String(format : "%6d원", self)
    }
}

