//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 17..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

struct Segment {
    private (set) var color : UIColor
    private (set) var value : CGFloat
    private (set) var name : String
}

class PieGraphView: UIView {
    
    private var colors : [UIColor] = [
        UIColor(red: 0.88, green:0.40, blue:0.40, alpha:1.0),
        UIColor(red:0.29, green:0.53, blue:0.91, alpha:1.0),
        UIColor(red:0.42, green:0.66, blue:0.31, alpha:1.0),
        .yellow,
        UIColor(red:0.56, green:0.49, blue:0.76, alpha:1.0),
        .gray
    ]
    
    private var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func setPieGraph(_ productsNameAndCount : [String : Int]) {
        var segments :[Segment] = []
        var indexOfColor = 0
        for oneKey in productsNameAndCount.keys {
            segments.append(Segment(color : colors[indexOfColor], value: CGFloat(productsNameAndCount[oneKey] ?? 0), name: oneKey))
            indexOfColor += 1
        }
        self.segments = segments
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = segments.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi * 0.5
        
        for segment in segments {
            ctx?.setFillColor(segment.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            ctx?.move(to: viewCenter)
            ctx?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx?.fillPath()
            
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            drawLegend(halfAngle: halfAngle, viewCenter: viewCenter, radius: radius, beverageName: segment.name)

            startAngle = endAngle
        }
    }
    
    private func drawLegend(halfAngle: CGFloat, viewCenter: CGPoint, radius: CGFloat, beverageName: String) {
        let textPositionValue: CGFloat = 0.68
        let segmentCenter = CGPoint(x: viewCenter.x + radius * textPositionValue * cos(halfAngle),
                                    y: viewCenter.y + radius * textPositionValue * sin(halfAngle))
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.foregroundColor: UIColor.black,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30 * 0.5)]
        let textToRender = beverageName
        var renderRect = CGRect(origin: .zero, size: textToRender.size(withAttributes: attributes))
        renderRect.origin = CGPoint(x: segmentCenter.x - renderRect.size.width * 0.5,
                                    y: segmentCenter.y - renderRect.size.height * 0.5)
        textToRender.draw(in: renderRect, withAttributes: attributes)
    }
}
