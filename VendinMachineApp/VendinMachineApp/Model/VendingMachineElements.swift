
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
    
    func pressedInsertCash(button: UIButton) -> Int? {
        return self.insertCashButtons[button]
    }
    
    func pressedAddBeverage(button: UIButton) -> Beverage.Type? {
        return self.addBeverageButtons[button]
    }
    
    func setUpBeverageImages(collection: [UIImageView]) {
        collection.forEach { imageView in
            imageView.contentMode = .scaleToFill
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.cornerRadius = 10
        }
    }
    
    func setUpAddBeverageButtons(collection: [UIButton]) {
        for (button, beverageType) in zip(collection, beverageList) {
            addBeverageButtons.updateValue(beverageType, forKey: button)
        }
    }
    
    func setUpInsertCashButtons(collection: [UIButton]) {
        for (button, money) in zip(collection, VendingMachineMoney.allCases) {
            insertCashButtons.updateValue(money.rawValue, forKey: button)
        }
    }
    
    func updateCurrentCash(label: UILabel, cashBox: Int) {
        label.text = "\(cashBox)"
    }
    
    func updateBeverageStock(labels: [UILabel], beverageStock: Beverages) {
        for (beverageLabel, beverageType) in zip(labels, beverageList) {
            beverageLabel.text = "\(beverageStock.beverageCount(elementType: beverageType))"
        }
    }
    
    func setUpAll(images: [UIImageView], beverageButtons: [UIButton], beverageStockLabels: [UILabel], beverageStock: Beverages, cashButtons: [UIButton], cashLabel: UILabel, cashBox: Int) {
        self.setUpBeverageImages(collection: images)
        self.setUpInsertCashButtons(collection: cashButtons)
        self.setUpAddBeverageButtons(collection: beverageButtons)
        self.updateCurrentCash(label: cashLabel, cashBox: cashBox)
        self.updateBeverageStock(labels: beverageStockLabels, beverageStock: beverageStock)
    }
}
