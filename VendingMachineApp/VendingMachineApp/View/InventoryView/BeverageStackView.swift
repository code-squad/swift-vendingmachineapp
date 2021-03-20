//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/08.
//
import UIKit

//class BeverageStackView: UIStackView {
//
//    public var beverageButton: UIAddBeverageButtonView!
//    public var beverageImage: UIImageView!
//    public var beverageQuantityLabel: UILabel!
//    public var beverageViewSet: UIStackView!
//    public var beverageType: Beverage.Type!
//    
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        addButton()
//        configureBeverageImage()
//        configureQuantityLabel()
//        makeBeverageViewSet()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addButton()
//        configureBeverageImage()
//        configureQuantityLabel()
//        makeBeverageViewSet()
//    }
//    
//    func addButton() {
//        beverageButton = UIAddBeverageButtonView.init(type: .system)
//        beverageButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
//        beverageButton.setTitle("Add", for: .normal)
//        beverageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        beverageButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
//    }
//
//    func configureBeverageImage() {
//        beverageImage = UIImageView()
//        beverageImage.layer.cornerRadius = 16.2
//        beverageImage.layer.shadowColor = UIColor.black.cgColor
//        beverageImage.layer.shadowOpacity = 1
//        beverageImage.layer.shadowOffset = .zero
//        beverageImage.layer.shadowRadius = 5
//        beverageImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        beverageImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
//    }
//
//    func configureQuantityLabel() {
//        beverageQuantityLabel = UILabel()
//        beverageQuantityLabel.textAlignment = .center
//        beverageQuantityLabel.textColor = .black
//        beverageQuantityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        beverageQuantityLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
//    }
//    
//    func loadQuantity(quantity: Int) {
//        beverageQuantityLabel.text = "\(quantity)"
//    }
//    
//    func makeBeverageViewSet() {
//        self.axis = NSLayoutConstraint.Axis.vertical
//        self.distribution = UIStackView.Distribution.fillProportionally
//        self.alignment = UIStackView.Alignment.center
//        self.spacing = 4.0
//        self.addArrangedSubview(beverageButton)
//        self.addArrangedSubview(beverageImage)
//        self.addArrangedSubview(beverageQuantityLabel)
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//    
//}

class BeverageStackView: UIStackView {

    private var beverageButton: UIAddBeverageButtonView!
    private var beverageImage: UIImageView!
    private var beverageQuantityLabel: UILabel!

    public var beverageType: Beverage.Type!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        addButton()
        configureBeverageImage()
        configureQuantityLabel()
        makeBeverageViewSet()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButton()
        configureBeverageImage()
        configureQuantityLabel()
        makeBeverageViewSet()
    }
    
    private func addButton() {
        beverageButton = UIAddBeverageButtonView.init(type: .system)
        beverageButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: .normal)
        beverageButton.setTitle("Add", for: .normal)
        beverageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beverageButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func configureBeverageImage() {
        beverageImage = UIImageView()
        beverageImage.layer.cornerRadius = 16.2
        beverageImage.layer.shadowColor = UIColor.black.cgColor
        beverageImage.layer.shadowOpacity = 1
        beverageImage.layer.shadowOffset = .zero
        beverageImage.layer.shadowRadius = 5
        beverageImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        beverageImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func configureQuantityLabel() {
        beverageQuantityLabel = UILabel()
        beverageQuantityLabel.textAlignment = .center
        beverageQuantityLabel.textColor = .black
        beverageQuantityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beverageQuantityLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    public func loadQuantity(quantity: Int) {
        beverageQuantityLabel.text = "\(quantity)"
    }
    
    private func makeBeverageViewSet() {
        self.axis = NSLayoutConstraint.Axis.vertical
        self.distribution = UIStackView.Distribution.fillProportionally
        self.alignment = UIStackView.Alignment.center
        self.spacing = 4.0
        self.addArrangedSubview(beverageButton)
        self.addArrangedSubview(beverageImage)
        self.addArrangedSubview(beverageQuantityLabel)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func deliverButton() -> UIAddBeverageButtonView {
        return beverageButton
    }
    
    public func deliverImage() -> UIImageView {
        return beverageImage
    }
    
    public func deliverQuantityLabel() -> UILabel {
        return beverageQuantityLabel
    }
    
    public func deliverType() -> Beverage.Type {
        return beverageType
    }
    
}
