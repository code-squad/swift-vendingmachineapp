//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class OneStockView: UIView {
    
    private var label : UILabel!
    public var addButton : UIBeverageButton!
    public var stockImageView : UIImageView!
    public var buyButton : UIBeverageButton!
    
    public var beverageType : Beverage.Type!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    func initSubViews(){
        // Image
        setStockImageView()
        
        // AddButton
        setStockAddButton()
        
        // Label
        setLabel()
        
        // PurchaseButton
        setBuyButton()
    }

    func setStockImageView(){
        stockImageView = UIImageView(frame: CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height))
        stockImageView.contentMode = UIView.ContentMode.scaleAspectFill
        stockImageView.clipsToBounds = true
        stockImageView.layer.cornerRadius = 10
        addSubview(stockImageView)
    }
    func setStockAddButton(){
        addButton = UIBeverageButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 40))
        addButton.setImage(UIImage(named: "addbutton"), for: .normal)
        addButton.setTitle("추가하기", for: .normal)
        addSubview(addButton)
    }
    func setLabel(){
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        label.textAlignment = .center
        label.text = "재고량 : 0"
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
    func setBuyButton(){
        buyButton = UIBeverageButton(frame: CGRect(x: 0, y: bounds.maxY + 40, width: bounds.width, height: 40))
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setImage(UIImage(named: "buybutton"), for: .normal)
        addSubview(buyButton)
    }
    func reloadLabelText(count : Int){
        label.text = "재고량 : \(count)"
    }
}
