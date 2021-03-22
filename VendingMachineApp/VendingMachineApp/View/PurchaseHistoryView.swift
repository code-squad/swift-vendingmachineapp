//
//  PurchaseHistoryScrollView.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/17.
//

import UIKit

class PurchaseHistoryView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func reset(with history: [Beverage]) {
        self.subviews.forEach { (imageView) in
            imageView.removeFromSuperview()
        }
        for index in 0..<history.count {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.white
            imageView.image = UIImage(named: history[index].name)
            imageView.contentMode = .scaleAspectFill
            let xPosition = 50 * CGFloat(index)
            imageView.frame = CGRect(x: xPosition, y: 0, width: 100, height: 100)
            self.contentSize.width = 50 * CGFloat(1 + index)
            self.addSubview(imageView)
        }
    }
}
