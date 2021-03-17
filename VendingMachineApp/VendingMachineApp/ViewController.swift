//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine!
    @IBOutlet weak var currentMoney: UILabel!
    @IBOutlet var amountLabels: [UILabel]!
    
    
//    required init?(coder: NSCoder) {
//        self.vendingMachine = VendingMachine()
//        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine!
//        super.init(coder: coder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine!
        currentMoney.text = "\(vendingMachine.checkBalance())원"
        updateAmountLabel()
    }

    @IBAction func moneyButtonTouched(_ sender: UIButton) {
        let amount = Int(sender.currentTitle ?? "0")!
        let collectedMoney = vendingMachine.collectMoney(with: Cash(rawValue: amount)!)
        currentMoney.text = "\(collectedMoney)원"
        
    }
    
    private let name = [0: StrawberryMilk.self, 1: ChocoMilk.self, 2: BananaMilk.self, 3: Coke.self, 4: Cider.self, 5: Fanta.self, 6: Cantata.self, 7: TOP.self, 8: Georgia.self]
    
    @IBAction func addStockButtonTouched(_ sender: UIButton) {
        let index = sender.tag
        let drinkType = name[index] ?? TOP.self
        let drink = drinkType.init()
        
        vendingMachine.add(item: drink)
        
        let drinkList = vendingMachine.inventoryList()
        let num = drinkList[ObjectIdentifier(type(of: drink))] ?? 0
        
        amountLabels[index].text = "\(num)개"
        
    }
    
    private func updateAmountLabel() {
        let drinkList = vendingMachine.inventoryList()
        
        (0...8).forEach{ index in
            let drinkType = name[index] ?? TOP.self
            let drink = drinkType.init()
            let num = drinkList[ObjectIdentifier(type(of: drink))] ?? 0
            
            amountLabels[index].text = "\(num)개"
        }
    }
}

