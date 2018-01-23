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
    private var area: CGRect
    private var count: Int
    init(_ area: CGRect) {
        self.area = area
        count = 0
    }

    func produce(_ source: UIImage?, _ spacing: CGFloat) -> UIImageView {
        let imageView = UIImageView(image: source)
        imageView.contentMode = .scaleAspectFit
        (count > 0) ? self.area.origin.x += spacing : nil
        imageView.frame = self.area
        count += 1
        return imageView
    }
}
