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
    private var startAngle: CGFloat = 0
    private var endAngle: CGFloat = 0
    let half: CGFloat = 2
    private var centerPoint: CGPoint {
        return CGPoint(x: bounds.width / half, y: bounds.height / half)
    }
    private var radius: CGFloat {
        return CGFloat(max(bounds.width, bounds.height) / half - self.lineWidth)
    }
    
    private var isDrawingCircle: Bool = false
    private var changedRadius: CGFloat = 0
    
    func getPurchased(_ purchased: [String: Int]) {
        self.purchased = purchased
        totalCount()
    }

    func totalCount() {
        for (_, value) in self.purchased {
            total += CGFloat(value)
        }
    }
    
    override func draw(_ rect: CGRect) {
        var colorIndex = 0
        let increase = 1

        if self.isDrawingCircle {
            drawBlackCircle(rect)
        } else {
            if changedRadius == 0 { changedRadius = radius }
            for (key, value) in self.purchased {
                colors[colorIndex].setFill()
                endAngle = startAngle + (half * .pi * CGFloat(value) / total)
                drawPath(kind: key)
                startAngle = endAngle
                colorIndex += increase
            }
        }
    }

    private func drawPath(kind: String) {
        let position: CGFloat = 0.6
        let fontSize: CGFloat = 20
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: changedRadius - lineWidth,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = self.lineWidth
        path.addLine(to: centerPoint)
        path.close()
        path.stroke()
        path.fill()
        let textPoint = CGPoint(x: centerPoint.x + changedRadius * position * cos((endAngle + startAngle) / half ) - (kind.size(withAttributes: nil).width / half),
                                y: centerPoint.y + changedRadius * position * sin((endAngle + startAngle) / half))
        kind.draw(at: textPoint, withAttributes: [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)])
    }
    
    private func drawBlackCircle(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: centerPoint, radius: changedRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.black.setFill()
        path.stroke()
        path.fill()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawingCircle = true
        guard let location = touches.first?.location(in: self) else { return }
        changedRadius = sqrt(pow((location.x - centerPoint.x), 2) + pow((location.y - centerPoint.y), 2))
        if changedRadius > radius {
            changedRadius = radius
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        changedRadius = sqrt(pow((location.x - centerPoint.x), 2) + pow((location.y - centerPoint.y), 2))
        if changedRadius > radius {
            changedRadius = radius
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawingCircle = false
        setNeedsDisplay()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        changedRadius = radius
        setNeedsDisplay()
    }
}

