//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation
import UIKit

protocol VendingMachineDelegate {
    
    func didTurnOn(images: [UIImageView], countLabels: [UILabel], machine: VendingMachine, moneyLabel: UILabel)
    
    func didAddMoneyTouched(sender: UIButton, machine: VendingMachine, label: UILabel)
    
    func didAddStockTouched(sender: UIButton, machine: VendingMachine, labels: [UILabel])
    
}

class VendingMachineUpdator: VendingMachineDelegate {
    
    func didTurnOn(images: [UIImageView], countLabels: [UILabel], machine: VendingMachine, moneyLabel: UILabel) {
        
        images.forEach { (image) in
            image.layer.cornerRadius = 15
        }
        
        countLabels.forEach { (label) in
            label.adjustsFontSizeToFitWidth = true
        }
        
        updateCounts(for: countLabels, stockList: machine.allStocks())
        updateBalance(for: moneyLabel, money: machine.moneyLeft())
    }
    
    func didAddMoneyTouched(sender: UIButton, machine: VendingMachine, label: UILabel) {
        if sender.restorationIdentifier == "add1K" {
            machine.insert(money: 1000)
        } else if sender.restorationIdentifier == "add5K" {
            machine.insert(money: 5000)
        }
        updateBalance(for: label, money: machine.moneyLeft())
    }
    
    private func updateBalance(for label: UILabel, money: Int) {
        label.text = "\(money)원"
    }
    
    func didAddStockTouched(sender: UIButton, machine: VendingMachine, labels: [UILabel]) {
        switch sender.restorationIdentifier {
        case "addAmericano":
            machine.addStock(of: Americano())
        case "addCafelatte":
            machine.addStock(of: CafeLatte())
        case "addChocolateMilk":
            machine.addStock(of: Chocolate())
        case "addCoke":
            machine.addStock(of: Coke())
        case "addMilkis":
            machine.addStock(of: Milkis())
        case "addPlainMilk":
            machine.addStock(of: Plain())
        default:
            return
        }
        updateCounts(for: labels, stockList: machine.allStocks())
    }
    
    func countValidation(for count: Int?) -> String {
        if let count = count {
            return "\(count)개"
        } else {
            return "품절"
        }
    }
    
    private func updateCounts(for labels: [UILabel], stockList: [Beverage: Int]) {
        for label in labels {
            switch label.restorationIdentifier {
            case "americano":
                label.text = countValidation(for: stockList[Americano()])
            case "cafelatte":
                label.text = countValidation(for: stockList[CafeLatte()])
            case "chocolateMilk":
                label.text = countValidation(for: stockList[Chocolate()])
            case "coke":
                label.text = countValidation(for: stockList[Coke()])
            case "milkis":
                label.text = countValidation(for: stockList[Milkis()])
            case "plainMilk":
                label.text = countValidation(for: stockList[Plain()])
            default:
                return
            }
        }
    }
}
