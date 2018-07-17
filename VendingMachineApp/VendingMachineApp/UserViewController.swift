//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var inventoryLabel: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var purchaseButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalance()
        updateInventory()
        updatePurchaseList()
        makeRoundImages()
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateBalance(notification:)), name: .didUpdateBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateInventory(notification:)), name: .didUpdateInventory, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdatePurchases(notification:)),name: .didUpdatePurchases, object: nil)
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
        updateBalance()
    }
    
    @objc private func didUpdatePurchases(notification: Notification) {
        updatePurchaseList()
    }

    private func updateBalance() {
        self.balanceLabel.text = "\(Vendingmachine.sharedInstance().checkBalance())원"
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
        for index in inventoryLabel.indices {
            self.inventoryLabel[index].text = "\(Vendingmachine.sharedInstance().countOfInventory(kinds[index]))개"
        }
    }
    
    @IBAction func purchaseBeverageButtonTouched(_ sender: UIButton) {
        let kinds = Vendingmachine.sharedInstance().makeKindOfBeverage()
        if let index = purchaseButton.index(of: sender) {
            Vendingmachine.sharedInstance().buyBeverage(kinds[index])
        }
    }

    private func updatePurchaseList() {
        let purchase = Vendingmachine.sharedInstance().checkPurchases()
        var xValue = 65
        for item in purchase {
            let itemImage = UIImage(named: makePurchaseImage(item.kind))
            let imageView : UIImageView = UIImageView(image: itemImage)
            imageView.frame = CGRect(x: xValue, y: 650, width: 140, height: 120)
            self.view.addSubview(imageView)
            xValue += 70
        }
    }
    
    private func makePurchaseImage(_ kind: String) -> String {
        switch kind {
        case Coke().kind:
            return "pepsi"
        case ChocoMilk().kind:
            return "chocomilk"
        case StrawberryMilk().kind:
            return "strawberrymilk"
        case Top().kind:
            return "top"
        case Sprite().kind:
            return "hotsix"
        default:
            return ""
        }
    }

    private func makeRoundImages() {
        beverageImages.forEach({
            $0.layer.cornerRadius = 20
            $0.layer.masksToBounds = true
        })
    }

}

