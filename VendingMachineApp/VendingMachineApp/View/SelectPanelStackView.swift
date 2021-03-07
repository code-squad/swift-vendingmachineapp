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
        guard let identifier = sender.accessibilityIdentifier else { return }
        switch identifier {
        case "BlueBottle Cold Brew(Bold)":
            self.delegate?.didAddedDrink(typeOf: BlueBottleColdBrew.self)
        case "Fanta Orange":
            self.delegate?.didAddedDrink(typeOf: Fanta.self)
        case "빙그레 바나나우유":
            self.delegate?.didAddedDrink(typeOf: BingBananaMilk.self)
        case "서울 우유 딸기맛":
            self.delegate?.didAddedDrink(typeOf: SeoulStrawberryMilk.self)
        case "Sanpellegrino":
            self.delegate?.didAddedDrink(typeOf: Sanpellegrino.self)
        case "StarBucks Cold Brew(Black)":
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
