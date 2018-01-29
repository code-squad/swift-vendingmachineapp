//
//  CGContextExtension.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

extension CGContext {
    func drawSegment(_ segment: Segment, in sector: Sector) {
        self.addArc(
            center: sector.origin,
            radius: sector.radius,
            startAngle: sector.startAngle,
            endAngle: sector.endAngle,
            clockwise: false)
        // 테두리를 그릴 선.
        self.addLine(to: sector.origin)
        self.setFillColor(segment.color.cgColor)
        self.setLineWidth(3)
        self.setStrokeColor(UIColor.black.cgColor)
        self.drawPath(using: .fillStroke)
    }
}
