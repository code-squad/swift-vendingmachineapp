//
//  BeverageStackView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class BeverageStackView : UIStackView {
    
    let stockLabel = StockLabel(frame: CGRect.init(), type: Drink())
    
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
        stockButton.addTarget(superview?.superview?.superview, action: #selector(ViewController.doAddStockButton(sender:)), for: .touchUpInside)
        
        let image = UIImage.init(named: type.name) ?? UIImage()
        let stockImageView = BeverageImageView(image: image)
        stockImageView.contentMode = .scaleAspectFill
        stockImageView.setting()
        

        stockLabel.setting(count: count)
        stockLabel.beverageType = type
        NotificationCenter.default.addObserver(self, selector: #selector(didStockChanged(_:)), name: .stockChanged, object: nil)
        
        self.addArrangedSubview(stockButton)
        self.addArrangedSubview(stockImageView)
        self.addArrangedSubview(stockLabel)
    }
    
    @objc func didStockChanged(_ notification: Notification) {
        let test = notification.object as! Dictionary<ObjectIdentifier,[Drink]>
        stockLabel.setting(count: test[ObjectIdentifier(type(of: stockLabel.beverageType))]!.count)
    }
}
