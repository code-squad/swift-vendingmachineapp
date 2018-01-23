//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

private struct Segment {
    private (set) var color: UIColor
    private (set) var value: CGFloat
    private (set) var name: String
}

class PieGraphView: UIView {
    private var receipts = [Beverage: Int]()
    private var segments = [Segment]()
    private var graphRatio: CGFloat = 0.5
    private let colors = [UIColor(red: 1.0, green: 31.0/255.0, blue: 73.0/255.0, alpha: 1.0),
                          UIColor(red: 1.0, green: 222.0/255.0, blue: 0.0, alpha: 1.0),
                          UIColor(red: 0.0, green: 222.0/255.0, blue: 1.0, alpha: 1.0),
                          UIColor(red: 1.0, green: 138.0/255.0, blue: 0.0, alpha: 1.0),
                          UIColor(red: 138.0/255.0, green: 1.0, blue: 222.0/255.0, alpha: 1.0)]
    
    func setPieGraph(receipts: [Beverage: Int]) {
        self.receipts = receipts
        self.segments = [
            Segment(color: colors[0],
                    value: CGFloat(receipts[Coke()] ?? 0),
                    name: Coke().description),
            Segment(color: colors[1],
                    value: CGFloat(receipts[LightBananaMilk()] ?? 0),
                    name: LightBananaMilk().description),
            Segment(color: colors[2],
                    value: CGFloat(receipts[Sprite()] ?? 0),
                    name: Sprite().description),
            Segment(color: colors[3],
                    value: CGFloat(receipts[CeylonTea()] ?? 0),
                    name: CeylonTea().description),
            Segment(color: colors[4],
                    value: CGFloat(receipts[StarBucksCoffee()] ?? 0),
                    name: StarBucksCoffee().description)
        ]
        setNeedsDisplay()
    }
    
    func setFillColor() {
        for index in 0..<segments.count {
           self.segments[index] = Segment(color: UIColor.black, value: 1, name: "")
        }
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let radius = min(bounds.size.width, bounds.size.height) * graphRatio
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = segments.reduce(0) { $0 + $1.value }
        var startAngle = -CGFloat.pi * 0.5
        
        for beverage in segments {
            context?.setFillColor(beverage.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (beverage.value / valueCount)
            context?.move(to: viewCenter)
            context?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.fillPath()
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            if beverage.value >= 1 {
                drawLegend(halfAngle: halfAngle, viewCenter: viewCenter, radius: radius, beverage: beverage)
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
        renderRect.origin = CGPoint(x: segmentCenter.x - renderRect.size.width * 0.5, y: segmentCenter.y - renderRect.size.height * 0.5)
        textToRender.draw(in: renderRect, withAttributes: attributes)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("began")
        setFillColor()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("move")
        if let touch = touches.first {
            let position = touch.location(in: self)
            let xValue = pow(bounds.size.width * 0.5 - position.x, 2)
            let yValue = pow(bounds.size.width * 0.5 - position.y, 2)
            let distance = sqrt(xValue + yValue)
            print(distance)
            graphRatio = distance / 100
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end")
        setPieGraph(receipts: self.receipts)
    }

}
