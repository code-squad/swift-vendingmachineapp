
import Foundation
import UIKit

class VendingMachineElements {
    private var addBeverageButtons: [UIButton:Beverage.Type]
    private var insertCashButtons: [UIButton:Int]
    private var beverageList: [Beverage.Type]
    
    init() {
        self.addBeverageButtons = [:]
        self.insertCashButtons = [:]
        self.beverageList = [BananaMilk.self, ChocoMilk.self, Coke.self, Cider.self, Americano.self, Latte.self]
    }
    
    func pressedAddBeverage(button: UIButton) -> Beverage.Type? {
        return self.addBeverageButtons[button]
    }
    
    func pressedInsertCash(button: UIButton) -> Int? {
        return self.insertCashButtons[button]
    }
    
    func setUpAddBeverage(buttons: [UIButton]) {
        for (button, beverageType) in zip(buttons, beverageList) {
            addBeverageButtons.updateValue(beverageType, forKey: button)
        }
    }
    
    func setUpInsertCash(buttons: [UIButton]) {
        for (button, money) in zip(buttons, VendingMachineMoney.allCases) {
            insertCashButtons.updateValue(money.rawValue, forKey: button)
        }
    }
    
    func updateBeverageStock(labels: [UILabel], in vendingMachine: VendingMachine) {
        for (beverageLabel, beverageType) in zip(labels, beverageList) {
            beverageLabel.text = "\(vendingMachine.beverageCount(beverageType: beverageType))"
        }
    }
}
