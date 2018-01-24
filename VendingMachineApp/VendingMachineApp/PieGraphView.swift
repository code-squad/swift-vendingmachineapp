//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

private struct Segment {
    private (set) var value: CGFloat
    private (set) var name: String
}

class PieGraphView: UIView {
    private var receipts = [Beverage: Int]()
    private var segments = [Segment]()
    private var graphRatio: CGFloat = 0.5
    private var tempColors: [UIColor]!
    private var colors = [UIColor(red: 1.0, green: 31.0/255.0, blue: 73.0/255.0, alpha: 1.0),
                          UIColor(red: 1.0, green: 222.0/255.0, blue: 0.0, alpha: 1.0),
                          UIColor(red: 0.0, green: 222.0/255.0, blue: 1.0, alpha: 1.0),
                          UIColor(red: 1.0, green: 138.0/255.0, blue: 0.0, alpha: 1.0),
                          UIColor(red: 138.0/255.0, green: 1.0, blue: 222.0/255.0, alpha: 1.0)]
    
    func setPieGraph(receipts: [Beverage: Int]) {
        self.graphRatio = 0.5
        self.receipts = receipts
        self.segments = [
            Segment(value: CGFloat(receipts[Coke()] ?? 0),
                    name: Coke().description),
            Segment(value: CGFloat(receipts[LightBananaMilk()] ?? 0),
                    name: LightBananaMilk().description),
            Segment(value: CGFloat(receipts[Sprite()] ?? 0),
                    name: Sprite().description),
            Segment(value: CGFloat(receipts[CeylonTea()] ?? 0),
                    name: CeylonTea().description),
            Segment(value: CGFloat(receipts[StarBucksCoffee()] ?? 0),
                    name: StarBucksCoffee().description)
        ]
        self.frame = CGRect(x: 337, y: 389,
                            width: 350,
                            height: 350)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawPieGraph(context: context, colors: colors)
    }
    
    private func drawFrame() {
        let scale = graphRatio * 1.5
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y,
                            width: 350 * scale,
                            height: 350 * scale)
        self.center = CGPoint(x: 512, y: 564)
    }
    
    private func drawPieGraph(context: CGContext, colors: [UIColor]) {
        let radius = min(bounds.size.width, bounds.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = segments.reduce(0) { $0 + $1.value }
        var startAngle = -CGFloat.pi * 0.5

        for index in 0..<segments.count {
            let endAngle = startAngle + 2 * .pi * (segments[index].value / valueCount)
            
            context.setFillColor(colors[index].cgColor)
            context.move(to: viewCenter)
            context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.fillPath()
            
            if segments[index].value >= 1 {
                let halfAngle = startAngle + (endAngle - startAngle) * 0.5
                drawLegend(halfAngle: halfAngle, viewCenter: viewCenter, radius: radius, beverage: segments[index])
            }
            
            startAngle = endAngle
        }
    }
    
    private func drawLegend(halfAngle: CGFloat, viewCenter: CGPoint, radius: CGFloat, beverage: Segment) {
        let textPositionValue: CGFloat = 0.67
        let segmentCenter = CGPoint(x: viewCenter.x + radius * textPositionValue * cos(halfAngle),
                                    y: viewCenter.y + radius * textPositionValue * sin(halfAngle))
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.foregroundColor: UIColor.white,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30 * graphRatio)]
        let textToRender = beverage.name as NSString
        var renderRect = CGRect(origin: .zero, size: textToRender.size(withAttributes: attributes))
        renderRect.origin = CGPoint(x: segmentCenter.x - renderRect.size.width * 0.5,
                                    y: segmentCenter.y - renderRect.size.height * 0.5)
        textToRender.draw(in: renderRect, withAttributes: attributes)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.tempColors = self.colors
        self.colors = [UIColor].init(repeating: UIColor.black, count: 5)
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
        self.colors = self.tempColors
        setNeedsDisplay()
    }
}
