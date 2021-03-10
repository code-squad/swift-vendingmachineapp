//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    @IBOutlet weak var currentMoney: UILabel!
    @IBOutlet var amountLabels: [UILabel]!
    
    
    required init?(coder: NSCoder) {
        self.vendingMachine = VendingMachine()
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func moneyButtonTouched(_ sender: UIButton) {
        let amount = Int(sender.currentTitle ?? "0")!
        vendingMachine.collectMoney(with: Money(rawValue: amount)!)
        currentMoney.text = "\(vendingMachine.checkBalance())원"
        
    }
    
    
    @IBAction func addStockButtonTouched(_ sender: UIButton) {
        let name = [0: StrawberryMilk(), 1: ChocoMilk(), 2: BananaMilk(), 3: Coke(), 4: Cider(), 5: Fanta(), 6: Cantata(), 7: TOP(), 8: Georgia()]
        let index = sender.tag
        let drink = name[sender.tag] ?? TOP()
        vendingMachine.add(item: drink)
        amountLabels[index].text = ""
        amountLabels.forEach { label in
            
        }
        
    }
}

