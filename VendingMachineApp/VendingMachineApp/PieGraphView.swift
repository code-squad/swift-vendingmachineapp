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

    private var purchases = [String: [Beverage]]()
    
    var total: CGFloat = 0

    func makePurchasesList(_ beverages: [Beverage]) {
        for beverage in beverages {
            purchases[beverage.kind, default: []].append(beverage)
        }
        totalCount()
    }
    
    func totalCount() {
        for (_, value) in purchases {
            total += CGFloat(value.count)
        }
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height) / 2 - self.lineWidth
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        var colorIndex = 0

        for (key, value) in purchases {
            colors[colorIndex].setFill()
            endAngle = startAngle + (2 * .pi * CGFloat(value.count) / total)
            drawPath(center, radius: radius, startAngle: startAngle, endAngle: endAngle,kind: key)
            startAngle = endAngle
            colorIndex += 1
        }

    }
    
    private func drawPath(_ center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, kind: String) {
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
        
        let textPoint = CGPoint(x: center.x + radius * 0.6 * cos((endAngle + startAngle) / 2 ) - (kind.size(withAttributes: nil).width / 2),
                                y: center.y + radius * 0.6 * sin((endAngle + startAngle) / 2))
        kind.draw(at: textPoint, withAttributes: [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)])
    }

}

