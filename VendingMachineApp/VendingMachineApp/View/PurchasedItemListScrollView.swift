//
//  PurchasedItemListScrollView.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/22.
//

import UIKit

class PurchasedItemListScrollView: UIScrollView {
    
    private var xPosition: CGFloat
        
    override init(frame: CGRect) {
        xPosition = 0
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        xPosition = 0
        super.init(coder: coder)
    }
    
    public func addImageView(image: UIImage) {
        let width: CGFloat = 140
        let height: CGFloat = 100
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(x: xPosition, y: 0, width: width, height: height)
        self.addSubview(imageView)
        xPosition += imageView.frame.width
        self.contentSize = CGSize(width: xPosition, height: imageView.frame.height)
        
    }
}
