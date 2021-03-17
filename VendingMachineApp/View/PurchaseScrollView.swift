//
//  PurchaseScrollView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/16.
//

import UIKit

class PurchaseScrollView : UIScrollView {
    
    private var place : CGFloat = 80
    private var count :CGFloat = 0
    
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
        self.isScrollEnabled = true
    }
    
    func addSubView(with image: UIImage) {
        let beverageView : UIImageView = {
            let view = UIImageView()
            view.frame = CGRect(origin: CGPoint(x: place * count, y: bounds.midY - 40), size: CGSize(width: 100, height: 100))
            count += 1
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            view.image = image
            return view
        }()
        self.addSubview(beverageView)
        updateContentSize()
    }
    func updateContentSize(){
        self.contentSize = CGSize(width: place * count, height: self.bounds.height)
    }
}
