//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class BeverageStackView : UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setting()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setting()
    }
    
    private func setting() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 40
        self.alignment = .center
        self.distribution = .fillProportionally
    }
    
    func collectSubelements(drink type : Drink, count : Int) {
        let stockButton = AddStockButton(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40), type: type)
        stockButton.setting()
        stockButton.addTarget(superview?.superview?.superview, action: #selector(ViewController.doEvent(sender:)), for: .touchUpInside)
        
        let image = UIImage.init(named: type.name) ?? UIImage()
        let stockImageView = BeverageImageView(image: image)
        stockImageView.contentMode = .scaleAspectFill
        stockImageView.setting()
        
        let stockLabel = StockLabel()
        stockLabel.setting(count: count)
        
        self.addArrangedSubview(stockButton)
        self.addArrangedSubview(stockImageView)
        self.addArrangedSubview(stockLabel)
    }
}
