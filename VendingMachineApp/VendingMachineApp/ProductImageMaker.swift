//
//  ProductImageMaker.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 23..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation
import UIKit

class ProductImageMaker {
    private var leftTop: CGPoint
    private let size: CGSize
    private var count: Int
    init(_ startX: Int, _ startY: Int) {
        self.leftTop = CGPoint(x: startX, y: startY)
        self.size = CGSize(width: 140, height: 100)
        count = 0
    }

    func imageViewWithPosition(_ source: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: source)
        imageView.contentMode = .scaleAspectFit
        updatePosition()
        imageView.frame = CGRect(origin: leftTop, size: size)
        count += 1
        return imageView
    }

    private func updatePosition() {
        if count > 0 {
            self.leftTop.x += 50
        }
    }
}
