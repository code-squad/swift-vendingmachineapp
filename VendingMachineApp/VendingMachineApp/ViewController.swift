//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let adminMode = AdminMode(with: VendingMachine.shared)
    private let userMode = UserMode(with: VendingMachine.shared)
    
    @IBAction func addBalance1000(_ sender: UIButton) {
        controlAddBalance(with: CashUnit.thousand)
    }
    @IBAction func addBalance5000(_ sender: UIButton) {
        controlAddBalance(with: CashUnit.fiveThousand)
    }
    @IBAction func tappedAddBeverageBtn(_ sender: UIButton) {
        if let selectedBeverage = Product(rawValue: sender.tag) {
            addStock(target: selectedBeverage)
        }
    }
    @IBAction func tappedPurchaseBtn(_ sender: UIButton) {
        if let selectedBeverage = Product(rawValue: sender.tag) {
            purchaseBeverage(target: selectedBeverage)
        }
    }
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var statusMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 옵저버 등록
        createdObservers()
        // Do any additional setup after loading the view, typically from a nib.
        refreshStock()
        refreshBalance()
        roundEdgeOfImage()
        refreshStatus()
        
    }
    
    // 옵저버 제거
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func refreshStatus() {
        self.statusMessage.text = adminMode.manageable.status
    }
    
    @objc private func refreshStock() {
        if let stockList =  adminMode.manageable.stockList() {
            for index in 0..<stockList.count {
                self.beverageStock[index].text = self.format(with: stockList[index])
            }
        }
    }
    
    @objc private func refreshBalance() {
        let balance = userMode.userable.presentBalance()
        self.balance.text = self.format(with: balance)
    }
    
    private func format(with beverages: [Beverage]) -> String {
        return "\(beverages.count)\(SeveralUnit.count)"
    }
    
    private func format(with balance: Int) -> String {
        return "\(balance)\(SeveralUnit.won)"
    }
    
    private func addStock(target: Product) {
        _ = adminMode.selectMenu(with: MenuAdmin.addStock, target: target.rawValue, amount: 1)
    }
    
    private func purchaseBeverage(target: Product) {
        do {
            _ = try userMode.selectMenu(with: Menu.purchaseBeverage, value: target.rawValue)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
    }
    
    private func controlAddBalance(with cash: CashUnit) {
        do {
            try addBalance(with: cash)
        } catch let error as Errorable {
            outputErrorMessage(error: error)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
    }
    
    private func addBalance(with cash: CashUnit) throws {
        do {
            _ = try userMode.selectMenu(with: Menu.addBalance, value: cash.rawValue)
        } catch let error as Errorable {
            throw error
        } catch {
            throw error
        }
    }
    
    private func outputErrorMessage(error: Errorable) {
        self.statusMessage.text  = error.description
    }
    
    private func roundEdgeOfImage() {
        for image in self.beverageImages {
            image.layer.cornerRadius = 10.0
        }
    }
    
    @objc private func refreshPurchase(_ notification: Notification) {
        self.refreshStock()
        self.refreshBalance()
        self.addPurchaseList(notification)
    }
    
    private func addPurchaseList(_ notification: Notification) {
        if let selectedBeverage = notification.userInfo?["Beverage"] as? Beverage {
            let beverageJPEG = selectedBeverage.className + ".jpeg"
            print("beverageJPEG : \(beverageJPEG)")
            let imageInstance = UIImage(named: beverageJPEG)
            let cardImage = UIImageView(image: imageInstance)
            let xValue = VendingMachine.shared.xValue
            let yValue = VendingMachine.shared.yValue
            cardImage.frame = CGRect(x: xValue, y: yValue, width: 100, height: 100)
            self.view.addSubview(cardImage)
            // 간격 추가
            VendingMachine.shared.xValue += 50
            // 끝까지 가는 경우 다음줄
            if VendingMachine.shared.xValue >= VendingMachine.shared.maxValue {
                VendingMachine.shared.yValue += 50
                VendingMachine.shared.xValue = 40
            }
        }
    }
    
    private func createdObservers() {
        // addStock
        let nameAddStock = Notification.Name(NotificationKey.addStock)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshStock), name: nameAddStock, object: nil)
        // addBalance
        let nameAddBalance = Notification.Name(NotificationKey.addBalance)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshBalance), name: nameAddBalance, object: nil)
        // purchaseBeverage
        let namePurchaseBeverage = Notification.Name(NotificationKey.purchaseBeverage)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshPurchase(_:)), name: namePurchaseBeverage, object: nil)
    }
}
