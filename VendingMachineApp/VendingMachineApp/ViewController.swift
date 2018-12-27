//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    @IBOutlet weak var quantityOfStrawberryMilk: UILabel!
    @IBOutlet weak var quantityOfChocolateMilk: UILabel!
    @IBOutlet weak var quantityOfSprite: UILabel!
    @IBOutlet weak var quantityOfPepsi: UILabel!
    @IBOutlet weak var quantityOfGeorgia: UILabel!
    @IBOutlet weak var quantityOfCantata: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        self.vendingMachine = VendingMachine(initialInventory: inventory)
        super.init(coder: aDecoder)
    }

    private func showBeverages() {
        let beverages = [Sprite(), Sprite(), Sprite(),
                         StrawberryMilk(), StrawberryMilk(),
                         Cantata(), Cantata()]
        beverages.forEach { vendingMachine.add(beverage: $0) }
        let form = { (name: String, stock: Int, check: Bool) in
            print("\(check ? "✅" : "🚫") \(name)(\(stock)개)")
        }
        vendingMachine.showListOfAll(with: form)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showBeverages()
        vendingMachine.showBalance(with: balanceForm(money:))
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private func insert(money: Int = 0) {
        guard vendingMachine.insert(money: money) else { return }
        vendingMachine.showBalance(with: balanceForm(money:))
    }

    @IBAction func insertOneThousand(_ sender: Any) {
        insert(money: 1000)
    }

    @IBAction func insertFiveThousands(_ sender: Any) {
        insert(money: 5000)
    }

}

