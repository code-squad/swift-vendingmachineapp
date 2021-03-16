//
//  PurchaseScrollView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/16.
//

import UIKit

class PurchaseScrollView : UIScrollView {
    
    private var place : CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    func setUp(){
        self.translatesAutoresizingMaskIntoConstraints = false
         
        let label : UILabel = {
            let label = UILabel()
            label.text = "구매 목록"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .white
            label.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 10)
            return label
        }()
        self.addSubview(label)
    }
    
    func append(with beverage: Beverage) {
        let beverageView : UIImageView = {
            let view = UIImageView()
            let image = ImageManager.getImage(type: type(of: beverage))
            view.frame = CGRect(origin: CGPoint(x: place, y: bounds.midY - 40), size: CGSize(width: 100, height: 100))
            place += 50
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            view.image = image
            return view
        }()
        self.addSubview(beverageView)
    }
}
