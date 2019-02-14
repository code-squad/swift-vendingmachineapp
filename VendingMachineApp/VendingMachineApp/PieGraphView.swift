//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 31/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

enum TouchState {
    case touched
    case notTouched
}

class PieGraphView: UIView {
    var data: DataSet?
    
    var radius: CGFloat?
    var colorRedValue: CGFloat?
    var colorGreenValue: CGFloat?
    var colorBlueValue: CGFloat?
    var viewCenter: CGPoint?
    var pastTouchPoint: CGPoint?
    var touchState: TouchState = .notTouched
    
    func set(data: DataSet?) {
        self.data = data
        radius = min(frame.size.width, frame.size.height) * 0.5
        colorRedValue = 0
        colorGreenValue = 0
        colorBlueValue = 1
        viewCenter = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.5)
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        guard let data = self.data else { return }
        var valueCount: Int {
            var count = 0
            for (_, value) in data.countOfEachPurchasedDrink { count += value }
            return count
        }
    
        drawPieGraphByTouched(ctx: ctx, valueCount: valueCount)
    }
    
    private func drawPieGraphByTouched(ctx: CGContext?, valueCount: Int) {
        var startAngle = -CGFloat.pi * 0.5
        
        guard var colorRedValue = self.colorRedValue else { return }
        guard var colorBlueValue = self.colorBlueValue else { return }
        guard let colorGreenValue = self.colorGreenValue else { return }
        guard let viewCenter = self.viewCenter else { return }
        guard let radius = self.radius else { return }
        
        guard let data = self.data else { return }
        
        switch touchState {
        case .notTouched:
            for(key, value) in data.countOfEachPurchasedDrink {
                ctx?.setFillColor(UIColor(red: colorRedValue, green: colorGreenValue, blue: colorBlueValue, alpha: 1.0).cgColor)
                
                let endAngle = startAngle + 2 * .pi * (CGFloat(value) / CGFloat(valueCount))
                
                ctx?.move(to: viewCenter)
                ctx?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                ctx?.fillPath()
                
                if value != 0 { drawLabel(text: key as NSString, startAngle: startAngle, endAngle: endAngle, radius: radius) }
                
                startAngle = endAngle
                colorRedValue += 0.2
                colorBlueValue -= 0.2
            }
        case .touched:
            ctx?.setFillColor(UIColor(red: colorRedValue, green: colorGreenValue, blue: colorBlueValue, alpha: 1.0).cgColor)
            ctx?.move(to: viewCenter)
            ctx?.addArc(center: viewCenter, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
            ctx?.fillPath()
        }
    }
    
    private func drawLabel(text: NSString, startAngle: CGFloat, endAngle: CGFloat, radius: CGFloat) {
        let fontSize = CGFloat(15)
        let moveLeft = CGFloat(text.length) * fontSize * 0.27
        let angle = startAngle + (endAngle - startAngle) * 0.5
        let point = CGPoint(x: frame.size.width / 2 + (radius * cos(angle)) * 0.5 - moveLeft,
                            y: frame.size.height / 2 + (radius * sin(angle)) * 0.5 - fontSize)
        text.draw(at: point, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize),
                                              NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchState = .touched
        pastTouchPoint = touches.first?.location(in: self)
        colorRedValue = 0
        colorBlueValue = 0
        colorGreenValue = 0
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let pastTouchPoint = self.pastTouchPoint else { return }
        guard let currentTouchPoint = touches.first else { return }
        guard let currentRadius = self.radius else { return }
        guard let viewCenter = self.viewCenter else { return }
        
        // 원점으로 더 가까워질 경우
        if pow(pastTouchPoint.x - viewCenter.x, 2) + pow(pastTouchPoint.y - viewCenter.y, 2) > pow(currentTouchPoint.location(in: self).x - viewCenter.x, 2) + pow(currentTouchPoint.location(in: self).y - viewCenter.y, 2) {
            if currentRadius >= 10 { self.radius = currentRadius - CGFloat(1) }
        } else if pow(pastTouchPoint.x - viewCenter.x, 2) + pow(pastTouchPoint.y - viewCenter.y, 2) < pow(currentTouchPoint.location(in: self).x - viewCenter.x, 2) + pow(currentTouchPoint.location(in: self).y - viewCenter.y, 2) {
            if currentRadius <= 200 { self.radius = currentRadius + CGFloat(1) }
        }
        self.pastTouchPoint = currentTouchPoint.location(in: self)  // 다음 비교를 위해 현재 위치 저장
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchState = .notTouched
        colorRedValue = 0
        colorBlueValue = 1
        colorGreenValue = 0
        setNeedsDisplay()
    }
    
}
