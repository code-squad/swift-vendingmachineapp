//
//  SelectPanelStackView.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/04.
//

import UIKit

protocol SelectPanelStackViewDelegate: class {
    func didAddedDrink(typeOf: Drink.Type)
}

class SelectPanelStackView: UIStackView {
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    @IBOutlet var addDrinkButtons: [UIButton]!
    @IBOutlet var stockDrinkLabels: [UILabel]!
    
    weak var delegate: SelectPanelStackViewDelegate?
    
    @IBAction func touchAddDrinkButton(_ sender: UIButton) {
        switch sender.tag {
        case DrinkTags.blueBottleColdBrewBold.rawValue:
            self.delegate?.didAddedDrink(typeOf: BlueBottleColdBrew.self)
        case DrinkTags.fantaOrange.rawValue:
            self.delegate?.didAddedDrink(typeOf: Fanta.self)
        case DrinkTags.bananaMilk.rawValue:
            self.delegate?.didAddedDrink(typeOf: BingBananaMilk.self)
        case DrinkTags.seoulStrawberryMilk.rawValue:
            self.delegate?.didAddedDrink(typeOf: SeoulStrawberryMilk.self)
        case DrinkTags.sanpellegrino.rawValue:
            self.delegate?.didAddedDrink(typeOf: Sanpellegrino.self)
        case DrinkTags.starbucksColdBrewBlack.rawValue:
            self.delegate?.didAddedDrink(typeOf: StarbucksColdBrew.self)
        default:
            break
        }
    }
    
    func setDrinkImageViewsRadius(of value: CGFloat) {
        drinkImageViews.forEach { (imageView) in
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = value
        }
    }
    
    
}
