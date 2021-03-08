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

class SelectPanelStackView: UIStackView {
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    @IBOutlet var addDrinkButtons: [UIButton]!
    @IBOutlet var stockDrinkLabels: [UILabel]!
    private lazy var eachButtonType: Dictionary<UIButton, Drink.Type> = [
        addDrinkButtons[0]: BlueBottleColdBrew.self,
        addDrinkButtons[1]: Fanta.self,
        addDrinkButtons[2]: BingBananaMilk.self,
        addDrinkButtons[3]: SeoulStrawberryMilk.self,
        addDrinkButtons[4]: Sanpellegrino.self,
        addDrinkButtons[5]: StarbucksColdBrew.self,
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
