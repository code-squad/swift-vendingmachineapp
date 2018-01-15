//
//  AppSetting.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 14..
//  Copyright © 2018년 Napster. All rights reserved.
//

import Foundation
import UIKit

struct AppSetting {
    private (set) static var fiveThounsand = 5000
    private (set) static var oneThounsand = 1000
    private (set) static var keyBox = [LightBananaMilk(), Coke(), StarBucksCoffee(), Sprite(), CeylonTea()]
    
    static func matches<T, U>(indexList: [T], valueList: [U]) -> [T: U] {
        var matchedList = [T: U]()
        for index in 0..<indexList.count {
            matchedList[indexList[index]] = valueList[index]
        }
        return matchedList
    }
    
    static func setLabelContent(key: Beverage, stockLabel: UILabel, balanceLabel: UILabel) {
        balanceLabel.text = String(VendingMachine.sharedInstance.vendingMachineBalance())
        setContets(key, stockLabel)
    }
    
    static func setLabelContent(key: Beverage, stockLabel: UILabel) {
        setContets(key, stockLabel)
    }
    
    private static func setContets(_ key: Beverage, _ stockLabel: UILabel) {
        let countingUnit = "개"
        if let sortedBeverage = VendingMachine.sharedInstance.sortedStockList[key] {
            stockLabel.text = "\(sortedBeverage)" + countingUnit
        } else {
            stockLabel.text = "0" + countingUnit
        }
    }
}

extension Int {
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

extension Notification.Name {
    static let labelNC = Notification.Name("labelNC")
    static let recepitNC = Notification.Name("recepitNC")
}
