//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by jang gukjin on 15/07/2019.
//  Copyright © 2019 jang gukjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let strawberryMilk = StrawberryMilk()
    let chocolateMilk = ChocolateMilk()
    let coke = Coke()
    let sprite = Sprite()
    let topCoffee = TOPCoffee()
    let cantataCoffee = CantataCoffee()
    
    private var vendingMachine = VendingMachine()
    
    @IBOutlet weak var stockOfStrawberryMilk: UILabel!
    @IBOutlet weak var stockOfChocolateMilk: UILabel!
    @IBOutlet weak var stockOfCoke: UILabel!
    @IBOutlet weak var stockOfSprite: UILabel!
    @IBOutlet weak var StockOfTOPCoffee: UILabel!
    @IBOutlet weak var stockOfCantataCoffee: UILabel!
    @IBOutlet weak var depositedMoney: UILabel!
    
    @IBAction func addStrawberryMilk(_ sender: Any) {
        vendingMachine.stockUp(of: strawberryMilk, count: 1)
        self.stockOfStrawberryMilk.text = "\(vendingMachine.isFullStock()[strawberryMilk]!)개"
    }
    @IBAction func addChocolateMilk(_ sender: Any) {
        vendingMachine.stockUp(of: chocolateMilk, count: 1)
        self.stockOfChocolateMilk.text = "\(vendingMachine.isFullStock()[chocolateMilk]!)개"
    }
    @IBAction func addCoke(_ sender: Any) {
        vendingMachine.stockUp(of: coke, count: 1)
        self.stockOfCoke.text = "\(vendingMachine.isFullStock()[coke]!)개"
    }
    @IBAction func addSprite(_ sender: Any) {
        vendingMachine.stockUp(of: sprite, count: 1)
        self.stockOfSprite.text = "\(vendingMachine.isFullStock()[sprite]!)개"
    }
    @IBAction func addTOPCoffee(_ sender: Any) {
        vendingMachine.stockUp(of: topCoffee, count: 1)
        self.StockOfTOPCoffee.text = "\(vendingMachine.isFullStock()[topCoffee]!)개"
    }
    @IBAction func addCantataCoffee(_ sender: Any) {
        vendingMachine.stockUp(of: cantataCoffee, count: 1)
        self.stockOfCantataCoffee.text = "\(vendingMachine.isFullStock()[cantataCoffee]!)개"
    }
    @IBAction func inputSmallMoney(_ sender: Any) {
        vendingMachine.pay(of: 1000)
        self.depositedMoney.text = "잔액: \(vendingMachine.checkBalance())"
    }
    @IBAction func inputLargeMoney(_ sender: Any) {
        vendingMachine.pay(of: 5000)
        self.depositedMoney.text = "잔액: \(vendingMachine.checkBalance())"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine.stockUp(of: strawberryMilk, count: 5)
        vendingMachine.stockUp(of: chocolateMilk, count: 5)
        vendingMachine.stockUp(of: coke, count: 5)
        vendingMachine.stockUp(of: sprite, count: 5)
        vendingMachine.stockUp(of: topCoffee, count: 5)
        vendingMachine.stockUp(of: cantataCoffee, count: 5)
        
        for (key, value) in vendingMachine.isFullStock() {
            print("\(key.getName()) (\(value)개)", terminator: " ")
        }
        
        self.stockOfStrawberryMilk.text = "\(vendingMachine.isFullStock()[strawberryMilk]!)개"
        self.stockOfChocolateMilk.text = "\(vendingMachine.isFullStock()[chocolateMilk]!)개"
        self.stockOfCoke.text = "\(vendingMachine.isFullStock()[coke]!)개"
        self.stockOfSprite.text = "\(vendingMachine.isFullStock()[sprite]!)개"
        self.StockOfTOPCoffee.text = "\(vendingMachine.isFullStock()[topCoffee]!)개"
        self.stockOfCantataCoffee.text = "\(vendingMachine.isFullStock()[cantataCoffee]!)개"
        self.depositedMoney.text = "잔액: \(vendingMachine.checkBalance())"
    }
}

