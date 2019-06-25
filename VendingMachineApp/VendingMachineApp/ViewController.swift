//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bananaMilkCount: UILabel!
    @IBOutlet weak var strawberryMilkCount: UILabel!
    @IBOutlet weak var fantaCount: UILabel!
    @IBOutlet weak var topCount: UILabel!
    @IBOutlet weak var hot6Count: UILabel!
    @IBOutlet weak var pepsiCokeCount: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    @IBAction func bananaMilkSupply(_ sender: Any) {
        vendingMachine.supply(1, amount: 1)
        let stock = vendingMachine.getStockList()
        let bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190930")
        self.bananaMilkCount.text = "\(stock[bananaMilk]!)개"
    }
    @IBAction func strawberryMilkSupply(_ sender: Any) {
        vendingMachine.supply(2, amount: 1)
        let stock = vendingMachine.getStockList()
        let strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190925")
        self.strawberryMilkCount.text = "\(stock[strawberryMilk]!)개"
    }
    @IBAction func fantaSupply(_ sender: Any) {
        vendingMachine.supply(3, amount: 1)
        let stock = vendingMachine.getStockList()
        let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.7, expirationDate: "20190921")
        self.fantaCount.text = "\(stock[fanta]!)개"
    }
    @IBAction func topSupply(_ sender: Any) {
        vendingMachine.supply(4, amount: 1)
        let stock = vendingMachine.getStockList()
        let top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190920")
        self.topCount.text = "\(stock[top]!)개"
    }
    @IBAction func hot6Supply(_ sender: Any) {
        vendingMachine.supply(5, amount: 1)
        let stock = vendingMachine.getStockList()
        let hot6 = Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
        self.hot6Count.text = "\(stock[hot6]!)개"
    }
    @IBAction func pepsiCokeSupply(_ sender: Any) {
        vendingMachine.supply(6, amount: 1)
        let stock = vendingMachine.getStockList()
        let pepsiCoke = PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
        self.pepsiCokeCount.text = "\(stock[pepsiCoke]!)개"
    }
    @IBAction func insertOneThousand(_ sender: Any) {
        vendingMachine.insertCoin(1000)
        let balance = vendingMachine.getBalance()
        self.balance.text = "\(balance)원"
    }
    @IBAction func insertFiveThousand(_ sender: Any) {
        vendingMachine.insertCoin(5000)
        let balance = vendingMachine.getBalance()
        self.balance.text = "\(balance)원"
    }
    
}

