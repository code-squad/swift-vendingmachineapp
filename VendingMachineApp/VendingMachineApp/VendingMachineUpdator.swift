//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation
import UIKit

protocol VendingMachinePresenter {
    
    func didTurnOn(images: [UIImageView], countLabels: [UILabel], machine: VendingMachine, moneyLabel: UILabel, beverageList: [Shopable])
    
    func didAddMoneyTouched(sender: UIButton, machine: VendingMachine, label: UILabel)
    
    func didAddStockTouched(sender: UIButton, machine: VendingMachine, labels: [UILabel], beverageList: [Shopable])
    
}

class VendingMachineUpdator: VendingMachinePresenter {
    
    func didTurnOn(images: [UIImageView], countLabels: [UILabel], machine: VendingMachine, moneyLabel: UILabel, beverageList: [Shopable]) {
        
        images.forEach { (image) in
            image.layer.cornerRadius = 15
        }
        
        countLabels.forEach { (label) in
            label.adjustsFontSizeToFitWidth = true
        }
        
        updateCounts(for: countLabels, stockList: machine.allStocks(), beverageList: beverageList)
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
    
    func didAddStockTouched(sender: UIButton, machine: VendingMachine, labels: [UILabel], beverageList: [Shopable]) {
        switch sender.restorationIdentifier {
        case "addAmericano":
            machine.addStock(of: beverageList[0])
        case "addCafelatte":
            machine.addStock(of: beverageList[1])
        case "addChocolateMilk":
            machine.addStock(of: beverageList[2])
        case "addCoke":
            machine.addStock(of: beverageList[3])
        case "addMilkis":
            machine.addStock(of: beverageList[4])
        case "addPlainMilk":
            machine.addStock(of: beverageList[5])
        default:
            return
        }
        updateCounts(for: labels, stockList: machine.allStocks(), beverageList: beverageList)
    }
    
    private func updateCounts(for labels: [UILabel], stockList: [ObjectIdentifier: Int], beverageList: [Shopable]) {
        for label in labels {
            switch label.restorationIdentifier {
            case "americano":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[0]))])
            case "cafelatte":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[1]))])
            case "chocolateMilk":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[2]))])
            case "coke":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[3]))])
            case "milkis":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[4]))])
            case "plainMilk":
                label.text = countValidation(for: stockList[ObjectIdentifier(type(of: beverageList[5]))])
            default:
                return
            }
        }
    }
    
    private func countValidation(for count: Int?) -> String {
        if let count = count {
            return "\(count)개"
        } else {
            return "품절"
        }
    }
}
