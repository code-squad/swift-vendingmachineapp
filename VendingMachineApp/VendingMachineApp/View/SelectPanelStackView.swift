//
//  SelectPanelStackView.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/04.
//

import UIKit

protocol SelectPanelStackViewDelegate: class {
    func didAddDrink(typeOf: Drink.Type)
}

class SelectPanelStackView: UIStackView {
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    @IBOutlet var addDrinkButtons: [UIButton]!
    @IBOutlet var stockDrinkLabels: [UILabel]!
    
    weak var delegate: SelectPanelStackViewDelegate?
    
    @IBAction func touchAddDrinkButton(_ sender: UIButton) {
        switch sender.tag {
        case DrinkTags.blueBottleColdBrewBold.rawValue:
            self.delegate?.didAddDrink(typeOf: BlueBottleColdBrew.self)
        case DrinkTags.fantaOrange.rawValue:
            self.delegate?.didAddDrink(typeOf: Fanta.self)
        case DrinkTags.bananaMilk.rawValue:
            self.delegate?.didAddDrink(typeOf: BingBananaMilk.self)
        case DrinkTags.seoulStrawberryMilk.rawValue:
            self.delegate?.didAddDrink(typeOf: SeoulStrawberryMilk.self)
        case DrinkTags.sanpellegrino.rawValue:
            self.delegate?.didAddDrink(typeOf: Sanpellegrino.self)
        case DrinkTags.starbucksColdBrewBlack.rawValue:
            self.delegate?.didAddDrink(typeOf: StarbucksColdBrew.self)
        default:
            break
        }
    }
    
    
}
