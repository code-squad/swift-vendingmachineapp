//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 23..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    
    private var historyOfPurchase: HistoryOfPurchase? {
        didSet {
            
        }
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                radius: bounds.width / 2,
                                startAngle: 0,
                                endAngle: .pi * 2,
                                clockwise: true)
        
        UIColor.green.setFill()
        path.fill()
    }
}
