//
//  SelectPanelStackView.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/04.
//

import UIKit

protocol SelectPanelStackViewDelegate: class {
    func didAddedDrink(typeOf drinkType: Drink.Type)
}

class DrinkOrder {
    private lazy var drinkOrder = [
        BlueBottleColdBrew.self,
        Fanta.self,
        BingBananaMilk.self,
        SeoulStrawberryMilk.self,
        Sanpellegrino.self,
        StarbucksColdBrew.self
    ]
    
    subscript (index: Int) -> Drink.Type {
        return drinkOrder[index]
    }
}

class SelectPanelStackView: UIStackView {
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    @IBOutlet var addDrinkButtons: [UIButton]!
    @IBOutlet var stockDrinkLabels: [UILabel]!
    private var drinkOrder = DrinkOrder()
    
    private lazy var eachButtonType: Dictionary<UIButton, Drink.Type> = [
        addDrinkButtons[0]: drinkOrder[0],
        addDrinkButtons[1]: drinkOrder[1],
        addDrinkButtons[2]: drinkOrder[2],
        addDrinkButtons[3]: drinkOrder[3],
        addDrinkButtons[4]: drinkOrder[4],
        addDrinkButtons[5]: drinkOrder[5],
    ]
    
    weak var delegate: SelectPanelStackViewDelegate?
    
    @IBAction func touchAddDrinkButton(_ sender: UIButton) {
        guard let drinkType = eachButtonType[sender] else { return }
        self.delegate?.didAddedDrink(typeOf: drinkType)
    }
    
    func setDrinkImageViewsRadius(of value: CGFloat) {
        drinkImageViews.forEach { (imageView) in
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = value
        }
    }
}
