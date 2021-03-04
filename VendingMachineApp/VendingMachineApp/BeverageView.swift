//
//  BeverageView.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/03.
//

import UIKit

class BeverageView: UIView {
    var stockAddButton: UIButton
    var beverageImageView: UIImageView
    var showStockLabel: UILabel
    
    override init(frame: CGRect) {
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
        showStockLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.green
            label.textAlignment = .center
            return label
        }()
        super.init(frame: frame)
        
        addSubview(stockAddButton)
        addSubview(beverageImageView)
        addSubview(showStockLabel)
    
        configureStockAddButton()
        configureBeverageImageView()
        configureShowStockLabel()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStockAddButton() {
        stockAddButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        stockAddButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        stockAddButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stockAddButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func configureBeverageImageView() {
        beverageImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        beverageImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        beverageImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        beverageImageView.topAnchor.constraint(equalTo: stockAddButton.bottomAnchor).isActive = true
    }
    
    func configureShowStockLabel() {
        showStockLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        showStockLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        showStockLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        showStockLabel.topAnchor.constraint(equalTo: beverageImageView.bottomAnchor).isActive = true
    }
    
    func setLabelText(with string: String) {
        self.showStockLabel.text = string
    }
}
