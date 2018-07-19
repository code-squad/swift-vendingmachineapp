//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 7. 18..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit
//@IBDesignable
class PieGraphView: UIView {
    
    private let lineWidth: CGFloat = 0
    private let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.purple]
    private var purchased: [String: Int] = [:]
    private var total: CGFloat = 0
    
    func getPurchased(_ purchased: [String: Int]) {
        self.purchased = purchased
        totalCount()
    }

    private func totalCount() {
        for (_, value) in purchased {
            total += CGFloat(value)
        }
    }
    
    override func draw(_ rect: CGRect) {
        let half: CGFloat = 2
        let center = CGPoint(x: bounds.width / half, y: bounds.height / half)
        let radius: CGFloat = max(bounds.width, bounds.height) / half - self.lineWidth
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        var colorIndex = 0
        let increase = 1

        for (key, value) in purchased {
            colors[colorIndex].setFill()
            endAngle = startAngle + (half * .pi * CGFloat(value) / total)
            drawPath(center, radius: radius, startAngle: startAngle, endAngle: endAngle,kind: key)
            startAngle = endAngle
            colorIndex += increase
        }

    }
    
    private func drawPath(_ center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, kind: String) {
        let half: CGFloat = 2
        let position: CGFloat = 0.6
        let fontSize: CGFloat = 20
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = self.lineWidth
        path.addLine(to: center)
        path.close()
        path.stroke()
        path.fill()
        
        let textPoint = CGPoint(x: center.x + radius * position * cos((endAngle + startAngle) / half ) - (kind.size(withAttributes: nil).width / half),
                                y: center.y + radius * position * sin((endAngle + startAngle) / half))
        kind.draw(at: textPoint, withAttributes: [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)])
    }

}

