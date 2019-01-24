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
    private var colors: [UIColor] = [.black, .gray, .orange, .red, .purple, .blue,]
    
    //MARK: - Methods
    
    override func draw(_ rect: CGRect) {
        
        let countOfAll = purchaseInfo.values.reduce(0) {$0 + $1}
        var startAngle: CGFloat = 0
        
        for (name, count) in purchaseInfo {
            let angleFromStartToEnd = (count / countOfAll)  * .pi * 2
            let path = makePath(startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd)
            colors.popLast()?.setFill()
            path.fill()
            let label = makeLabel(name: name, startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd / 2)
            startAngle += angleFromStartToEnd
            addSubview(label)
        }
    }
    
    //MARK: Private
    
    private func makePath(startAngle: CGFloat, angleFromStartToEnd: CGFloat) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.width / 2,
                    startAngle: startAngle,
                    endAngle: startAngle + angleFromStartToEnd,
                    clockwise: true)
        path.close()
        
        return path
    }
    
    private func makeLabel(name: String, startAngle: CGFloat, angleFromStartToEnd: CGFloat) -> UILabel {
        
        let label = UILabel()
        label.text = name
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.frame.size = CGSize(width: 20, height: 20)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                radius: bounds.width / 2,
                                startAngle: startAngle,
                                endAngle: startAngle + angleFromStartToEnd,
                                clockwise: true)
        
        let x = (path.currentPoint.x - bounds.midX) / 2 + bounds.midX
        let y = (path.currentPoint.y - bounds.midY) / 2 + bounds.midY
        
        let position = CGPoint(x: x, y: y)
        label.center = position
        
        return label
    }
}
