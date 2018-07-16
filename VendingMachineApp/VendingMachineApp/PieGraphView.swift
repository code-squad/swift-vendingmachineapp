//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 14..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    
    var dataSource: PieGraphViewDataSource?
    
    private let colors = [UIColor.green, UIColor.orange, UIColor.red, UIColor.purple, UIColor.blue]
    private var isDrawingCircle: Bool = false
    private let lineWidth: CGFloat = 0
    private var dynamicRadius: CGFloat = 0
    private var centerPoint: CGPoint = CGPoint(x: 0, y: 0)
    private var radius: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        self.radius = max(bounds.width, bounds.height) / 2 - lineWidth
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        self.radius = max(bounds.width, bounds.height) / 2 - lineWidth
    }
    
    private let textShadow: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray
        shadow.shadowBlurRadius = 3
        return shadow
    }()

    private var totalCount: CGFloat {
        guard let dataSource = self.dataSource else { return 0 }
        return CGFloat(dataSource.countList.values.reduce(0, { $0 + $1}))
    }
    
    override func draw(_ rect: CGRect) {
        guard let dataSource = self.dataSource else { return }
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        
        if self.isDrawingCircle {
            drawBlackCircle(rect)
        } else {
            if dynamicRadius == 0 { dynamicRadius = radius }
            for (index, count) in dataSource.countList.enumerated() {
                colors[index].setFill()
                endAngle = startAngle + (2 * .pi * CGFloat(count.value) / totalCount)
                drawPie(startAngle, endAngle)
                addSectionText(NSString(string: count.key), startAngle, endAngle)
                startAngle = endAngle
            }
        }
    }
    
    private func drawPie(_ startAngle: CGFloat, _ endAngle: CGFloat) {
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: dynamicRadius - lineWidth,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = lineWidth
        path.addLine(to: centerPoint)
        path.close()
        path.stroke()
        path.fill()
    }
    
    private func addSectionText(_ text: NSString, _ startAngle: CGFloat, _ endAngle: CGFloat) {
        let textPoint = CGPoint(x: centerPoint.x + dynamicRadius * 0.6 * cos((endAngle + startAngle) / 2 ) - (text.size(withAttributes: nil).width / 2),
                                y: centerPoint.y + dynamicRadius * 0.6 * sin((endAngle + startAngle) / 2))
        text.draw(at: textPoint, withAttributes: [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20 * dynamicRadius / radius),
                                                  NSAttributedStringKey.shadow: textShadow])
    }
    
    private func drawBlackCircle(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: dynamicRadius,
                                startAngle: 0,
                                endAngle: 2 * .pi,
                                clockwise: true)
        UIColor.black.setFill()
        path.stroke()
        path.fill()
    }
    
    private func calculateDistance(to end: CGPoint, from start: CGPoint) -> CGFloat {
        let distance = sqrt((end.x - start.x)^^ + (end.y - start.y)^^)
        if distance > radius {
            return radius
        }
        return distance
    }
    
    // MARK: Touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawingCircle = true
        guard let location = touches.first?.location(in: self) else { return }
        let distance = self.calculateDistance(to: location, from: centerPoint)
        dynamicRadius = distance
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        let distance = self.calculateDistance(to: location, from: centerPoint)
        dynamicRadius = distance
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawingCircle = false
        setNeedsDisplay()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        dynamicRadius = radius
        setNeedsDisplay()
    }
}

// ^^는 제곱을 하는 사용자 정의 연산자
postfix operator ^^
postfix func ^^(value: CGFloat) -> CGFloat {
    return value * value
}
