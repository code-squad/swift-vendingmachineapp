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
    
    private var vendingmachine: Vendingmachine

    let beverages = BeverageFactory().setBeverage()
    
    required init?(coder aDecoder: NSCoder) {
        vendingmachine = Vendingmachine(beverages)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBalance()
        updateInventory()
        makeRoundImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addMoneyButtonTouched(_ sender: UIButton) {
        let onethousand = 1000
        let fivethousand = 5000
        switch sender.tag {
        case 0:
            vendingmachine.addBalance(onethousand)
        case 1:
            vendingmachine.addBalance(fivethousand)
        default:
            return
        }
        updateBalance()
    }
    
    private func updateBalance() {
        self.balance.text = "\(vendingmachine.checkBalance())원"
    }

    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vendingmachine.addPurchases(StrawberryMilk())
        case 1:
            vendingmachine.addPurchases(ChocoMilk())
        case 2:
            vendingmachine.addPurchases(Coke())
        case 3:
            vendingmachine.addPurchases(Top())
        case 4:
            vendingmachine.addPurchases(Sprite())
        default:
            return
        }
        updateInventory()
    }

    private func updateInventory() {
        for index in inventory.indices {
            inventory[index].text = String(vendingmachine.countOfInventory(index.beverageKind)) + "개"
        }
    }

    private func makeRoundImages() {
        beverageImages.forEach({
            $0.layer.cornerRadius = 20
            $0.layer.masksToBounds = true
        })
    }

}

