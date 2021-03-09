//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

protocol StockDelegate {
    func addStock(type : Beverage.Type)
}

class OneStockView: UIView {
    
    private var label : UILabel!
    private var button : UIButton!
    private var stockImageView : UIImageView!
    private var stockImage : UIImage!
    private var beverageType : Beverage.Type!
    private var count : Int = 0
    
    var delegate : StockDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    init(frame: CGRect, type : Beverage.Type, image : UIImage?){
        super.init(frame: frame)
        self.beverageType = type
        self.stockImage = image
        initSubViews()
    }
    
    func initSubViews(){
        // Image
        setStockImageView()
        
        // Button
        setButton()
        
        // Label
        setLable()
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
        button = UIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 40))
        button.setTitle("추가하기", for: .normal)
        button.setImage(UIImage(named: "button"), for: .normal)
        button.addTarget(self, action: #selector(addStock), for: .touchDown)
        addSubview(button)
    }
    func setLable(){
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        label.textAlignment = .center
        label.text = "재고량 : \(count)"
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
    
    @objc func addStock(_ sender : UIButton){
        delegate?.addStock(type: beverageType)
    }
}
