//
//  BeverageView.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/03.
//

import UIKit

class BeverageView: UIView {
    public var stockAddButton: UIButton
    private var beverageImageView: UIImageView
    private var stockCountLabel: UILabel
    public var boundBeverage: Beverage!
    
    init(with beverage: Beverage) {
        stockAddButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("추가", for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .normal)
            return button
        }()
        beverageImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = UIColor.blue
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        stockCountLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.green
            label.textAlignment = .center
            return label
        }()
        boundBeverage = beverage
        
        super.init(frame: CGRect())
        
        addSubview(stockAddButton)
        addSubview(beverageImageView)
        addSubview(stockCountLabel)
    
        configureStockAddButton()
        configureBeverageImageView()
        configureShowStockLabel()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStockAddButton() {
        stockAddButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        stockAddButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        stockAddButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stockAddButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    private func configureBeverageImageView() {
        beverageImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        beverageImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        beverageImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        beverageImageView.topAnchor.constraint(equalTo: stockAddButton.bottomAnchor).isActive = true
    }
    
    private func configureShowStockLabel() {
        stockCountLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        stockCountLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        stockCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stockCountLabel.topAnchor.constraint(equalTo: beverageImageView.bottomAnchor).isActive = true
    }
    
    public func setStockLabelText(with amount: Int) {
        self.stockCountLabel.text = "\(amount) 개"
    }
}
