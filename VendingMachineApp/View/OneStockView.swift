//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class OneStockView: UIView {
    
    private var label : UILabel!
    private var stockImageView : UIImageView!
    public var button : UIBeverageButton!

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
        setStockImageView()
        setLabel()
    }
    func setStockImageView(){
        stockImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - 40))
        stockImageView.contentMode = UIView.ContentMode.scaleAspectFill
        stockImageView.clipsToBounds = true
        stockImageView.layer.cornerRadius = 10
        addSubview(stockImageView)
    }
    func setImage(with image : UIImage){
        self.stockImageView.image = image
    }
    func setLabel(){
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height - 80, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        label.textAlignment = .center
        label.text = "재고량 : 0"
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
    func setButton(for type : UIBeverageButton.ButtonType){
        switch type {
        case .add:
            setAddButton()
        case .buy:
            setBuyButton()
        }
    }
    private func setBuyButton(){
        button = UIBeverageButton(frame: CGRect(x: 0, y: bounds.maxY - 40, width: bounds.width, height: 40))
        button.setTitle("구매하기", for: .normal)
        button.setImage(UIImage(named: "buybutton"), for: .normal)
        addSubview(button)
    }
    private func setAddButton(){
        button = UIBeverageButton(frame: CGRect(x: 0, y: bounds.maxY - 40, width: bounds.width, height: 40))
        button.setImage(UIImage(named: "addbutton"), for: .normal)
        button.setTitle("추가하기", for: .normal)
        addSubview(button)
    }
    func reloadLabelText(count : Int){
        label.text = "재고량 : \(count)"
    }
}
