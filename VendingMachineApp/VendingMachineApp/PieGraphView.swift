//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 23..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

@IBDesignable
class PieGraphView: UIView {
    
    //MARK: - Properties
    
    private var purchaseInfo: [String: CGFloat] = ["가": 1, "나": 2, "다": 3, "라": 4, "마": 5, "사": 6,]
    private var colors: [UIColor] = [.black, .green, .orange, .red, .purple, .blue,]
    
    //MARK: - Methods
    
    override func draw(_ rect: CGRect) {
        
        let countOfAll = purchaseInfo.values.reduce(0) {$0 + $1}
        var startAngle: CGFloat = 0
        
        for (_, count) in purchaseInfo {
            let endAngle = startAngle + (count / countOfAll)  * .pi * 2
            let path = makePath(startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
            colors.popLast()?.setFill()
            path.fill()
        }
    }
    
    private func makePath(startAngle: CGFloat, endAngle: CGFloat) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.width / 2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)
        path.close()
        
        return path
    }
}
