//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UserOperable {
    private var userMode = UserMode(with: VendingMachine.shared)
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var statusMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 옵저버 등록
        createdObservers()
        refreshStock()
        refreshBalance()
        refreshStatus()
        restoreHistory()
    }
    
    // 옵저버 제거
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createdObservers() {
        // addStock
        let nameUpdateStock = Notification.Name(NotificationKey.updateStock)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshStock), name: nameUpdateStock, object: nil)

        // addBalance
        let nameUpdateBalance = Notification.Name(NotificationKey.updateBalance)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshBalance), name: nameUpdateBalance, object: nil)

        // purchaseBeverage
        let namePurchaseBeverage = Notification.Name(NotificationKey.purchaseBeverage)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshPurchase(_:)), name: namePurchaseBeverage, object: nil)
    }
    
    @objc func refreshStock() {
        guard let stockList = userMode.userable.stockList() else { return }
        for index in 0..<stockList.count {
            self.beverageStock[index].text = Formatter.format(with: stockList[index])
        }
    }
    
    @objc func refreshBalance() {
        let balance = userMode.userable.presentBalance()
        self.balance.text = Formatter.format(with: balance)
    }
    
    @objc func refreshPurchase(_ notification: Notification) {
        guard let selectedBeverage = notification.userInfo?["Beverage"] as? Beverage else { return }
        placeImage(with: selectedBeverage)
    }
    
    func refreshStatus() {
        self.statusMessage.text = userMode.userable.status
    }
    
    func restoreHistory() {
        let historyList = userMode.userable.historyList()
        guard historyList.count > 0 else { return }
        for purchasedBeverage in historyList {
            placeImage(with: purchasedBeverage)
        }
    }
    
    @IBAction func addBalance1000(_ sender: UIButton) {
        controlAddBalance(with: CashUnit.thousand)
    }
    @IBAction func addBalance5000(_ sender: UIButton) {
        controlAddBalance(with: CashUnit.fiveThousand)
    }
    @IBAction func tappedPurchaseBtn(_ sender: UIButton) {
        if let selectedBeverage = Product(rawValue: sender.tag) {
            purchaseBeverage(target: selectedBeverage)
        }
    }
    
    private func controlAddBalance(with cash: CashUnit) {
        do {
            try addBalance(with: cash)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
    }
    
    private func addBalance(with cash: CashUnit) throws {
        do {
            _ = try userMode.selectMenu(with: Menu.addBalance, value: cash.rawValue)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
    }
    
    private func purchaseBeverage(target: Product) {
        do {
            _ = try userMode.selectMenu(with: Menu.purchaseBeverage, value: target.rawValue)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
    }
    
    private func placeImage(with beverage: Beverage) {
        let beverageJPEG = beverage.className + ".jpeg"
        let imageInstance = UIImage(named: beverageJPEG)
        let cardImage = UIImageView(image: imageInstance)
        let xValue = userMode.userable.xValue
        let yValue = userMode.userable.yValue
        cardImage.frame = CGRect(x: xValue, y: yValue, width: 100, height: 100)
        
        self.view.addSubview(cardImage)
        // 간격 추가
        userMode.userable.increaseX(with: 50)
        // 끝까지 가는 경우 다음줄
        if userMode.userable.xValue >= userMode.userable.maxValue {
            userMode.userable.increaseY(with: 50)
            userMode.userable.restoreX(with: 40)
        }
    }
    
    private func outputErrorMessage(error: Errorable) {
        self.statusMessage.text  = error.description
    }
}
