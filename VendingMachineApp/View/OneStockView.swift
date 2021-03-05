//
//  OneStockView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/04.
//

import UIKit

class OneStockView: UIView {
    
    var label : UILabel!
    var button : UIButton!
    var imageView : UIImageView!
    var count : Int = 0
    var caption : String  = "재고량"
    
    var image : UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }
    
    func initSubViews(){
        
        button = UIButton(type: .system)
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: bounds.width , height: 40)
        button.setBackgroundImage(UIImage(named: "button"), for: .normal)
        button.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        addSubview(button)

        imageView = UIImageView(frame: CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        label.textAlignment = .center
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
    
    @objc func buttonPushed(){
        self.count += 1
        self.label.text = "재고량 : \(count)"
    }
}
