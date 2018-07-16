//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balance: UILabel!
    @IBOutlet var inventory: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalance(Vendingmachine.sharedInstance().checkBalance())
        updateInventory()
        makeRoundImages()
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateBalance(notification:)), name: .didUpdateBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateInventory(notification:)), name: .didUpdateInventory, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        let onethousand = 1000
        let fivethousand = 5000
        switch sender.tag {
        case 0:
            Vendingmachine.sharedInstance().addBalance(onethousand)
        case 1:
            Vendingmachine.sharedInstance().addBalance(fivethousand)
        default:
            return
        }
    }
    
    @objc private func didUpdateInventory(notification : Notification) {
        updateInventory()
    }

    @objc private func didUpdateBalance(notification: Notification) {
        guard let balance = notification.userInfo?[UserInfo.balance] as? Int else {
            return
        }
        updateBalance(balance)
    }

    private func updateBalance(_ balance: Int) {
        self.balance.text = "\(Vendingmachine.sharedInstance().checkBalance())원"
    }

    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            Vendingmachine.sharedInstance().addPurchases(Coke())
        case 1:
            Vendingmachine.sharedInstance().addPurchases(ChocoMilk())
        case 2:
            Vendingmachine.sharedInstance().addPurchases(StrawberryMilk())
        case 3:
            Vendingmachine.sharedInstance().addPurchases(Top())
        case 4:
            Vendingmachine.sharedInstance().addPurchases(Sprite())
        default:
            return
        }
    }

    private func updateInventory() {
        let kinds = Vendingmachine.sharedInstance().makeKindOfBeverage()
        for index in inventory.indices {
            self.inventory[index].text = "\(Vendingmachine.sharedInstance().countOfInventory(kinds[index]))개"
        }
    }

    private func makeRoundImages() {
        beverageImages.forEach({
            $0.layer.cornerRadius = 20
            $0.layer.masksToBounds = true
        })
    }

}

