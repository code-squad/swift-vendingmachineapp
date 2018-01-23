//
//  ProductImageMaker.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 23..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class ProductImageViewMaker {
    private var leftTop: CGPoint
    private let size: CGSize
    private var count: Int
    init(_ leftTop: CGPoint, _ size: CGSize) {
        self.leftTop = leftTop
        self.size = size
        count = 0
    }

    func produce(_ source: UIImage?, _ spacing: CGFloat) -> UIImageView {
        let imageView = UIImageView(image: source)
        imageView.contentMode = .scaleAspectFit
        (count > 0) ? self.leftTop.x += spacing : nil
        imageView.frame = CGRect(origin: leftTop, size: size)
        count += 1
        return imageView
    }
}
