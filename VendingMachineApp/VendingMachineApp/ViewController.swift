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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let vendingMachine = self.vendingMachine else { return }
        updateBalance(vendingMachine.getBalance())
        updateInventory()
        updateListOfPurchase()
        NotificationCenter.default.addObserver(self, selector: #selector(updateInventoryLabels(notification:)), name: .didUpdateInventory , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBalanceLabel(notification:)), name: .didUpdateBalance , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateListOfPurchase(notification:)), name: .didUpdateListOfPurchase , object: nil)
    }
    
    @IBAction func addInventoryButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.vendingMachine else { return }
        switch sender.restorationIdentifier {
        case "add1Product"? : vendingMachine.addBeverage(StrawberryMilk())
        case "add2Product"?: vendingMachine.addBeverage(BananaMilk())
        case "add3Product"?: vendingMachine.addBeverage(PepciCoke())
        case "add4Product"?: vendingMachine.addBeverage(Fanta())
        case "add5Product"?: vendingMachine.addBeverage(TOPCoffee())
        case "add6Product"?: vendingMachine.addBeverage(Georgia())
        default:
            return
        }
    }
    
    @IBAction func buyProductButtonTouched(_ sender: UIButton) {
        guard let vendingMachine = self.vendingMachine else { return }
        switch sender.restorationIdentifier {
        case "buy1Product"? : vendingMachine.buy(StrawberryMilk())
        case "buy2Product"?: vendingMachine.buy(BananaMilk())
        case "buy3Product"?: vendingMachine.buy(PepciCoke())
        case "buy4Product"?: vendingMachine.buy(Fanta())
        case "buy5Product"?: vendingMachine.buy(TOPCoffee())
        case "buy6Product"?: vendingMachine.buy(Georgia())
        default:
            return
        }
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
        var xOfImage = 70
        for oneProduct in productsSold {
            let productImg = UIImage(named : getImgSource(ObjectIdentifier(type(of : oneProduct)))) ?? UIImage()
            let imageView = UIImageView(image : productImg)
            imageView.frame = CGRect(x: xOfImage, y: 650, width: 150, height: 150)
            self.view.addSubview(imageView)
            xOfImage += 80
        }
    }
    
    private func getImgSource(_ productKind : ObjectIdentifier) -> String {
        switch productKind {
        case StrawberryMilk.getKind(): return Keyword.Img.strawberryMilk.rawValue
        case BananaMilk.getKind(): return Keyword.Img.bananaMilk.rawValue
        case PepciCoke.getKind(): return Keyword.Img.pepciCoke.rawValue
        case Fanta.getKind(): return Keyword.Img.fanta.rawValue
        case TOPCoffee.getKind(): return Keyword.Img.topCoffee.rawValue
        case Georgia.getKind(): return Keyword.Img.georgia.rawValue
        default: return ""
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

