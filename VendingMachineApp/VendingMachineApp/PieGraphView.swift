//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var graphRatio: CGFloat = 0.5
    private var touchsBeganFlag = false
    private var data: PieGraphDataSource!
    
    func setPieGraph(pieGraphData: PieGraphDataSource) {
        self.graphRatio = 0.5
        self.frame = CGRect(x: 337, y: 389, width: 350, height: 350)
        self.data = pieGraphData
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawPieGraph(context: context)
    }
    
    private func drawFrame() {
        let scale = graphRatio * 1.5
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y,
                            width: 350 * scale,
                            height: 350 * scale)
        self.center = CGPoint(x: 512, y: 564)
    }
    
    private func drawPieGraph(context: CGContext) {
        let radius = min(bounds.size.width, bounds.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let sumOfBeverage = data.getUserBuyHistory().reduce(0) { $0 + $1.value }
        var startAngle = -CGFloat.pi * 0.5

        for (key, _ ) in data.getUserBuyHistory() {
            guard let beverageCount = data.getUserBuyHistory()[key] else { return }
            let angleRatio = CGFloat(beverageCount) / CGFloat(sumOfBeverage)
            let endAngle = startAngle + (2 * .pi) * angleRatio
            
            if touchsBeganFlag {
                context.setFillColor(UIColor.black.cgColor)
            } else {
                context.setFillColor(data.colors[key]?.cgColor ?? UIColor.black.cgColor)
            }
            
            context.move(to: viewCenter)
            context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.fillPath()
            
            if beverageCount >= 1 {
                let halfAngle = startAngle + (endAngle - startAngle) * 0.5
                drawLegend(halfAngle: halfAngle, viewCenter: viewCenter, radius: radius, beverage: key)
            }
            
            startAngle = endAngle
        }
    }
    
    private func drawLegend(halfAngle: CGFloat, viewCenter: CGPoint, radius: CGFloat, beverage: Beverage) {
        let textPositionValue: CGFloat = 0.67
        let segmentCenter = CGPoint(x: viewCenter.x + radius * textPositionValue * cos(halfAngle),
                                    y: viewCenter.y + radius * textPositionValue * sin(halfAngle))
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.foregroundColor: UIColor.white,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30 * graphRatio)]
        let textToRender = beverage.description
        var renderRect = CGRect(origin: .zero, size: textToRender.size(withAttributes: attributes))
        renderRect.origin = CGPoint(x: segmentCenter.x - renderRect.size.width * 0.5,
                                    y: segmentCenter.y - renderRect.size.height * 0.5)
        textToRender.draw(in: renderRect, withAttributes: attributes)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.touchsBeganFlag = true
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let position = touch.location(in: self)
            let xValue = pow(bounds.size.width * 0.5 - position.x, 2)
            let yValue = pow(bounds.size.width * 0.5 - position.y, 2)
            let distance = sqrt(xValue + yValue)
            let scale = distance / 100
            graphRatio = scale
        }
        drawFrame()
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.touchsBeganFlag = false
        setNeedsDisplay()
    }
}
