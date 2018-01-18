//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 15..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

struct Segment {
    private (set) var color: UIColor
    private (set) var value: CGFloat
    private (set) var name: String
}

class PieGraphView: UIView {
    private var receipts = [Beverage: Int]()
    private var segments = [Segment]()
    private let graphRatio: CGFloat = 0.5
    
    func setPieGraph(receipts: [Beverage: Int]) {
        self.receipts = receipts
        self.segments = [
            Segment(color: UIColor(red: 1.0, green: 31.0/255.0, blue: 73.0/255.0, alpha: 1.0),
                    value: CGFloat(receipts[Coke()] ?? 0),
                    name: Coke().description),
            Segment(color: UIColor(red: 1.0, green: 222.0/255.0, blue: 0.0, alpha: 1.0),
                    value: CGFloat(receipts[LightBananaMilk()] ?? 0),
                    name: LightBananaMilk().description),
            Segment(color: UIColor(red: 0.0, green: 222.0/255.0, blue: 1.0, alpha: 1.0),
                    value: CGFloat(receipts[Sprite()] ?? 0),
                    name: Sprite().description),
            Segment(color: UIColor(red: 1.0, green: 138.0/255.0, blue: 0.0, alpha: 1.0),
                    value: CGFloat(receipts[CeylonTea()] ?? 0),
                    name: CeylonTea().description),
            Segment(color: UIColor(red: 138.0/255.0, green: 1.0, blue: 222.0/255.0, alpha: 1.0),
                    value: CGFloat(receipts[StarBucksCoffee()] ?? 0),
                    name: StarBucksCoffee().description)
        ]
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let radius = min(frame.size.width, frame.size.height) * graphRatio
        let viewCenter = CGPoint(x: bounds.size.width * graphRatio, y: bounds.size.height * graphRatio)
        let valueCount = segments.reduce(0) { $0 + $1.value }
        var startAngle = -CGFloat.pi * graphRatio
        
        for beverage in segments {
            context?.setFillColor(beverage.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (beverage.value / valueCount)
            context?.move(to: viewCenter)
            context?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.fillPath()
            // get the angle midpoint
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            if beverage.value >= 1 {
                drawLegend(halfAngle: halfAngle, viewCenter: viewCenter, radius: radius, beverage: beverage)
            }
            startAngle = endAngle
        }
    }
    
    private func drawLegend(halfAngle: CGFloat, viewCenter: CGPoint, radius: CGFloat, beverage: Segment) {
        // the ratio of how far away from the center of the pie chart the text will appear
        let textPositionValue: CGFloat = 0.67
        // get the 'center' of the segment. It's slightly biased to the outer edge, as it's wider.
        let segmentCenter = CGPoint(x: viewCenter.x + radius * textPositionValue * cos(halfAngle),
                                    y: viewCenter.y + radius * textPositionValue * sin(halfAngle))
        // text to render – the segment value is formatted to 1dp if needed to be displayed.
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.foregroundColor: UIColor.white,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let textToRender = beverage.name as NSString
        // center the origin of the rect
        var renderRect = CGRect(origin: .zero, size: textToRender.size(withAttributes: attributes))
        renderRect.origin = CGPoint(x: segmentCenter.x - renderRect.size.width * 0.5, y: segmentCenter.y - renderRect.size.height * 0.5)
        // draw text in the rect, with the given attributes
        textToRender.draw(in: renderRect, withAttributes: attributes)
    }
}
