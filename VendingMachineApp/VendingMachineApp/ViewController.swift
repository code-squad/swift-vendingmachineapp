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
    }

}

