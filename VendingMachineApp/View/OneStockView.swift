//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class OneStockView: UIView {
    
    private var label : UILabel!
    private var button : UIBeverageButton!
    private var stockImageView : UIImageView!
    private var stockImage : UIImage!
    // TODO: let으로 바꾸기 or type을 변수로 가지지 않도록 바꿔보기
    public var beverageType : Beverage.Type!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    init(frame: CGRect, type : Beverage.Type, image : UIImage?, count : Int){
        super.init(frame: frame)
        self.stockImage = image
        self.beverageType = type
        button = UIBeverageButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 40), type: type)
        initSubViews()
    }
    
    func initSubViews(){
        // Image
        setStockImageView()
        
        // Button
        setButton()
        
        // Label
        setLabel()
    }

    func setStockImageView(){
        stockImageView = UIImageView(frame: CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height))
        stockImageView.contentMode = UIView.ContentMode.scaleAspectFill
        stockImageView.image = stockImage
        stockImageView.clipsToBounds = true
        stockImageView.layer.cornerRadius = 10
        addSubview(stockImageView)
    }
    func setButton(){
        addSubview(button)
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

    func reloadLabelText(count : Int){
        label.text = "재고량 : \(count)"
    }
}
