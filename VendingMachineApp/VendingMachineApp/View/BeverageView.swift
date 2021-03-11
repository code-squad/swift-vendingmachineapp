//
//  BeverageView.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/09.
//

import UIKit

class BeverageView: UIView {
    
    private(set) var addToInventoryButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추가", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
        }()
    
    private var beverageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.white
        return imageView
        }()
    
    private(set) var numberOfBeveragesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "0"
        label.textAlignment = .center
        return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSubViews()
    }
    
    private func drawSubViews() {
        self.addSubview(addToInventoryButton)
        self.addSubview(beverageImageView)
        self.addSubview(numberOfBeveragesLabel)
        
        configureButton()
        configureImageView()
        configureLabel()
    }
    
    public func setImage(image: UIImage) {
        beverageImageView.image = image
    }
    
    public func setLabel(text: String) {
        numberOfBeveragesLabel.text = text
    }
    
    private func configureButton() {
        addToInventoryButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        addToInventoryButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        addToInventoryButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
    private func configureImageView() {
        beverageImageView.topAnchor.constraint(equalTo: addToInventoryButton.bottomAnchor).isActive = true
        beverageImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        beverageImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    private func configureLabel() {
        numberOfBeveragesLabel.topAnchor.constraint(equalTo: beverageImageView.bottomAnchor).isActive = true
        numberOfBeveragesLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        numberOfBeveragesLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        drawSubViews()
    }
}


