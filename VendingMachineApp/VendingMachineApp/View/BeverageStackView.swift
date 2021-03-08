//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/08.
//

import UIKit

struct BeverageStackView {
    
    private let beverageButton = UIButton()
    private let beverageImage = UIImageView()
    private let beverageQuantity = UILabel()
    private let beverageViewSet = UIStackView()
    private var beverageName = String()
    private var imageName = String()
    
    func addButton() -> UIButton {
        beverageButton.setTitleColor(.black, for: .normal)
        beverageButton.setTitle("Add", for: .normal)
        beverageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beverageButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return beverageButton
    }
    
    func addBeverageImage() -> UIImageView {
        beverageImage.image = UIImage(named: imageName)
        beverageImage.layer.cornerRadius = 16.2
        beverageImage.layer.shadowColor = UIColor.black.cgColor
        beverageImage.layer.shadowOpacity = 1
        beverageImage.layer.shadowOffset = .zero
        beverageImage.layer.shadowRadius = 5
        beverageImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        beverageImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return beverageImage
    }
    
    func addBeverageLabel() -> UILabel {
        beverageQuantity.text = beverageName
        beverageQuantity.textAlignment = .center
        beverageQuantity.textColor = .black
        beverageQuantity.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beverageQuantity.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return beverageQuantity
    }
    
    func makeBeverageViewSet() -> UIStackView {
        beverageViewSet.axis = NSLayoutConstraint.Axis.vertical
        beverageViewSet.distribution = UIStackView.Distribution.fillProportionally
        beverageViewSet.alignment = UIStackView.Alignment.center
        beverageViewSet.spacing = 4.0
        beverageViewSet.addArrangedSubview(addButton())
        beverageViewSet.addArrangedSubview(addBeverageImage())
        beverageViewSet.addArrangedSubview(addBeverageLabel())
        beverageViewSet.translatesAutoresizingMaskIntoConstraints = false
        return beverageViewSet
    }
    
    init(beverageName: String, imageName: String) {
        self.beverageName = beverageName
        self.imageName = imageName
    }
    
}
