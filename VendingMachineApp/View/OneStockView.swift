//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class OneStockView: UIView {
    
    var label : UILabel!
    var button : AddStockButton!
    var imageView : UIImageView!
    var count : Int = 0
    var image : UIImage!
    var beverageType : Beverage.Type!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    
    init(frame: CGRect, name: String){
        super.init(frame: frame)
        image = UIImage(named: name)
        beverageType = name.toBeverageType() ?? Beverage.self
        initSubViews()
    }
    
    func initSubViews(){
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height))
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        addSubview(imageView)
        
        button = AddStockButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 40), beverageType: beverageType)
        addSubview(button)
        
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        label.textAlignment = .center
        label.text = "재고량 : \(count)"
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
    
    @objc func buttonPushed(){
        self.count += 1
        self.label.text = "재고량 : \(count)"
    }
}
