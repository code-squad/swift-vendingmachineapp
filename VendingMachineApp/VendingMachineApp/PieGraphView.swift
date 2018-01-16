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
}

class PieGraphView: UIView {
    private var receipts = [Beverage: Int]()
    private var segments = [Segment]()
    private let graphRatio: CGFloat = 0.5
    
    func setPieGraph(receipts: [Beverage: Int]) {
        self.receipts = receipts
        self.segments = [
            Segment(color: .red, value: CGFloat(receipts[Coke()] ?? 0)),
            Segment(color: .yellow, value: CGFloat(receipts[LightBananaMilk()] ?? 0)),
            Segment(color: .blue, value: CGFloat(receipts[Sprite()] ?? 0)),
            Segment(color: .orange, value: CGFloat(receipts[CeylonTea()] ?? 0)),
            Segment(color: .green, value: CGFloat(receipts[StarBucksCoffee()] ?? 0))
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
            startAngle = endAngle
        }
    }
}
