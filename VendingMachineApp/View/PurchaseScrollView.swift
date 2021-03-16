//
//  PurchaseScrollView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/16.
//

import UIKit

class PurchaseScrollView : UIScrollView {
    
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
    }
    
    func append(with beverage: Beverage) {
        let beverageView : UIImageView = {
            let view = UIImageView()
            let image = ImageManager.getImage(type: type(of: beverage))
            view.image = image
            return view
        }()
        self.addSubview(beverageView)
    }
    
}
