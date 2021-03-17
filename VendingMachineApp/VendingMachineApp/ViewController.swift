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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine!
        
        currentMoney.text = "\(vendingMachine.checkBalance())원"
        reloadAmountLabels()
    }
    
    
    @IBAction func moneyButtonTouched(_ sender: UIButton) {
        let amount = Int(sender.currentTitle ?? "0")!
        let collectedMoney = vendingMachine.collectMoney(with: Cash(rawValue: amount)!)

        currentMoney.text = "\(collectedMoney)원"
    }
    
    @IBAction func addStockButtonTouched(_ sender: UIButton) {
        let drink = searchDrinkFromButton(at: sender.tag)
        
        vendingMachine.add(item: drink)
        updateAmountLabel(at: sender.tag)
    }
    
    
    private func reloadAmountLabels() {
        (0...8).forEach{ index in
            updateAmountLabel(at: index)
        }
    }
    
    private func updateAmountLabel(at index: Int) {
        let drink = searchDrinkFromButton(at: index)
        let drinkList = vendingMachine.inventoryList()
        let num = drinkList[ObjectIdentifier(type(of: drink))] ?? 0
        
        amountLabels[index].text = "\(num)개"
    }
    
    private func searchDrinkFromButton(at index: Int) -> Beverage {
        let name = [0: StrawberryMilk.self,
                    1: ChocoMilk.self,
                    2: BananaMilk.self,
                    3: Coke.self,
                    4: Cider.self,
                    5: Fanta.self,
                    6: Cantata.self,
                    7: TOP.self,
                    8: Georgia.self]
        let drinkType = name[index] ?? TOP.self
        return drinkType.init()
    }
}

