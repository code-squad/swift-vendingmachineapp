//
//  BeverageView.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/03.
//

import UIKit

class BeverageView: UIView {
    public var stockAddButton: UIButton
    private var itemImageView: UIImageView
    private var stockCountLabel: UILabel
    public var purchaseButton: UIButton
    public var boundBeverage: Beverage
    
    init(with beverage: Beverage) {
        stockAddButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("추가", for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .normal)
            return button
        }()
        itemImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = UIColor.white
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        stockCountLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()
        
        purchaseButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("구매", for: .normal)
            button.setTitleColor(UIColor.systemRed, for: .normal)
            return button
        }()
    
        boundBeverage = beverage
        
        super.init(frame: CGRect())
        
        addSubview(stockAddButton)
        addSubview(itemImageView)
        addSubview(stockCountLabel)
        addSubview(purchaseButton)
    
        configureStockAddButton()
        configureBeverageImageView()
        configureShowStockLabel()
        configurePurchaseButton()
        
        itemImageView.image = UIImage(named: boundBeverage.name)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStockAddButton() {
        stockAddButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        stockAddButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        stockAddButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stockAddButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    private func configureBeverageImageView() {
        itemImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        itemImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: stockAddButton.bottomAnchor).isActive = true
    }
    
    private func configureShowStockLabel() {
        stockCountLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.10).isActive = true
        stockCountLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        stockCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stockCountLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor).isActive = true
    }
    
    private func configurePurchaseButton() {
        purchaseButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        purchaseButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        purchaseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        purchaseButton.topAnchor.constraint(equalTo: stockCountLabel.bottomAnchor).isActive = true
    }

    public func setStockLabelText(with amount: Int) {
        self.stockCountLabel.text = "\(amount) 개"
    }
}
