//
//  PurchaseButtonStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/19.
//

import UIKit

class PurchaseButtonStackView: UIStackView {

    private var purchaseButton: UIPurchaseButton!
    private var purchaseButtonArray: [UIPurchaseButton]!
    public var beverageType: Beverage.Type!
    private var skuList: [Beverage.Type] = [DrPepper.self, FantaOrange.self, Sprite.self, CantataAmericano.self, BlueBottle.self]
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        makeButton()
        makeViewSet()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButton()
        makeViewSet()
    }
    
    private func makeButton() {
        purchaseButtonArray = [UIPurchaseButton]()
        for i in 0...4 {
            let purchaseButton = UIPurchaseButton(type: .system)
            purchaseButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
            purchaseButton.setTitle("Buy", for: .normal)
            purchaseButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            purchaseButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
            purchaseButton.beverageType = skuList[i]
            purchaseButtonArray.append(purchaseButton)
        }
    }
    
    private func makeViewSet() {
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution = UIStackView.Distribution.fillProportionally
        self.alignment = UIStackView.Alignment.center
        self.spacing = 16.2
        self.translatesAutoresizingMaskIntoConstraints = false
        for i in 0..<purchaseButtonArray.count {
            self.addArrangedSubview(purchaseButtonArray[i])
        }
    }
    
}
