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
    
    weak var delegate: SelectPanelStackViewDelegate?
    
    @IBAction func touchAddDrinkButton(_ sender: UIButton) {
        guard let index = addDrinkButtons.firstIndex(of: sender) else { return }
        let drinkType = drinkOrder[index]
        self.delegate?.didAddedDrink(typeOf: drinkType)
    }
    
    func setDrinkImageViewsRadius(of value: CGFloat) {
        drinkImageViews.forEach { (imageView) in
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = value
        }
    }
}
