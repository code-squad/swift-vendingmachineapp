//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/08.
//

import UIKit

class BeverageStackView: UIViewController {

    private let beverageButton = UIButton()
    private let beverageImage = UIImageView()
    private let beverageQuantityLabel = UILabel()
    private let beverageViewSet = UIStackView()
    private var imageName = String()
    private var vendingMachine = VendingMachine()
    
    func addButton() -> UIButton {
        beverageButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
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

    func addBeverageQuantityLabel() -> UILabel {
        beverageQuantityLabel.text = "0"
        beverageQuantityLabel.textAlignment = .center
        beverageQuantityLabel.textColor = .black
        beverageQuantityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beverageQuantityLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return beverageQuantityLabel
    }

    func makeBeverageViewSet() -> UIStackView {
        beverageViewSet.axis = NSLayoutConstraint.Axis.vertical
        beverageViewSet.distribution = UIStackView.Distribution.fillProportionally
        beverageViewSet.alignment = UIStackView.Alignment.center
        beverageViewSet.spacing = 4.0
        beverageViewSet.addArrangedSubview(addButton())
        beverageViewSet.addArrangedSubview(addBeverageImage())
        beverageViewSet.addArrangedSubview(addBeverageQuantityLabel())
        beverageViewSet.translatesAutoresizingMaskIntoConstraints = false
        return beverageViewSet
    }

    init(imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
