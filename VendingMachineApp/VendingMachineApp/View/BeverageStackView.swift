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
    }
    
    func setting() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .center
    }
    
    func collectSubelements(drink name : String, count : Int) {
        let stockButton = AddStockButton()
        stockButton.setting()
        
        let image = UIImage.init(named: name) ?? UIImage()
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
