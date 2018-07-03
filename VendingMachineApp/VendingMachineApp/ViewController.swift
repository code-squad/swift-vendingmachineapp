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
        addBalanceLabel()
        addInventoryLabel()
        makeRoundImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addMoneyButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            vendingmachine.addBalance(1000)
        case 1:
            vendingmachine.addBalance(5000)
        default:
            return
        }
        addBalanceLabel()
    }
    
    private func addBalanceLabel() {
        self.balance.text = "\(vendingmachine.checkBalance())원"
    }

    @IBAction func addBeverageButton(_ sender: UIButton) {
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
        addInventoryLabel()
    }

    private func addInventoryLabel() {
        let beverages = [StrawberryMilk().kind, ChocoMilk().kind, Coke().kind, Top().kind, Sprite().kind]
        for index in inventory.indices {
            self.inventory[index].text = String(vendingmachine.countOfInventory(beverages[index])) + "개"
        }
    }

    private func makeRoundImages() {
        beverageImages.forEach({
            $0.layer.cornerRadius = 20
            $0.layer.masksToBounds = true
        })
    }
    
    private func showInventory() {
        print("=> ", terminator: "")
        let beverage = vendingmachine.makeKindOfBeverage()
        for item in beverage {
            let beverages = vendingmachine[item]
            if let kinds = beverages?.map({$0.kind}) {
                print("\(kinds.first ?? "")(\(kinds.count)개) ", terminator: "")
            }
        }
    }
}

