
import Foundation
import UIKit

class VendingMachineElements {
    private var addBeverageButtons: [UIButton:Beverage.Type]
    private var insertCashButtons: [UIButton:Int]
    private var buyBeverageButtons: [UIButton:Beverage.Type]
    private(set) var beverageList: [Beverage.Type]
    
    init() {
        self.addBeverageButtons = [:]
        self.insertCashButtons = [:]
        self.buyBeverageButtons = [:]
        self.beverageList = [BananaMilk.self, ChocoMilk.self, Coke.self, Cider.self, Americano.self, Latte.self]
    }
    
    func pressedInsertCash(button: UIButton) -> Int? {
        return self.insertCashButtons[button]
    }
    
    func pressedAddBeverage(button: UIButton) -> Beverage.Type? {
        return self.addBeverageButtons[button]
    }
    
    func pressedBuyBeverage(button: UIButton) -> Beverage.Type? {
        return self.buyBeverageButtons[button]
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
        for (button, money) in zip(collection, VendingMachine.Money.allCases) {
            insertCashButtons.updateValue(money.rawValue, forKey: button)
        }
    }
    
    func setUpBuyBeverageButtons(collection: [UIButton]) {
        for (button, beverageType) in zip(collection, beverageList) {
            buyBeverageButtons.updateValue(beverageType, forKey: button)
        }
    }
    
    func setUpAll(images: [UIImageView], beverageButtons: [UIButton], cashButtons: [UIButton], buyButtons: [UIButton]) {
        self.setUpBeverageImages(collection: images)
        self.setUpInsertCashButtons(collection: cashButtons)
        self.setUpAddBeverageButtons(collection: beverageButtons)
        self.setUpBuyBeverageButtons(collection: buyButtons)
    }
}
