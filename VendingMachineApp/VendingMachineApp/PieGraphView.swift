//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 24..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    // AdminViewController에서 의존성 주입.
    var segments: [Segment]? {
        didSet {
            // 세그먼트에 변화가 생기면 뷰 업데이트.
            self.setNeedsDisplay()
        }
    }

    var sum: Int? {
        return segments?.reduce(0, { $0 + $1.value })
    }

    var textAttributes: [NSAttributedStringKey: Any]? {
        return [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15, weight: .init(rawValue: 5)),
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }

    override func draw(_ rect: CGRect) {
        let origin = CGPoint(x: bounds.width/2, y: bounds.height/2)
        // 경계 부분이 잘릴 수 있으니 -6 정도로 여유를 준다.
        let radius = CGFloat(min(bounds.width, bounds.height)/2-6)
        var startAngle: CGFloat = 0
        segments?.forEach { segment in
            let endAngle: CGFloat = startAngle + radians(from: degree(of: segment.value))
            let sector = Sector(origin: origin, radius: radius, startAngle: startAngle, endAngle: endAngle)
            drawGraph(segment, in: sector)
            drawText(segment, inside: sector)
            startAngle = endAngle
        }
    }

    private func drawText(_ segment: Segment, inside sector: Sector) {
        let text = NSMutableAttributedString(string: segment.name, attributes: textAttributes)
        let halfAngle = sector.startAngle + (sector.endAngle-sector.startAngle)/2
        // 절반은 너무 좁아서 반지름길이의 2/3 정도로 잡음.
        let halfRadius = sector.radius*2/3
        // 텍스트 중앙정렬을 위해 글자 실제길이의 절반을 왼쪽으로 옮김(-).
        let centerOfSegment = CGPoint(
            x: sector.origin.x+cos(halfAngle)*halfRadius-text.size().width/2,
            y: sector.origin.y+sin(halfAngle)*halfRadius)
        text.draw(at: centerOfSegment)
    }

    private func drawGraph(_ segment: Segment, in sector: Sector) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addArc(
            center: sector.origin,
            radius: sector.radius,
            startAngle: sector.startAngle,
            endAngle: sector.endAngle,
            clockwise: false)
        // 테두리를 그릴 선.
        ctx?.addLine(to: sector.origin)
        ctx?.setFillColor(segment.color.cgColor)
        ctx?.setLineWidth(3)
        ctx?.setStrokeColor(UIColor.black.cgColor)
        ctx?.drawPath(using: .fillStroke)
    }

    private func degree(of value: Int?) -> CGFloat {
        guard let value = value, let sum = sum else { return 0 }
        return (CGFloat(value)*360)/CGFloat(sum)
    }

    private func radians(from degrees: CGFloat) -> CGFloat {
        return (CGFloat.pi*degrees)/180
    }

}

struct Sector {
    let origin: CGPoint
    let radius: CGFloat
    let startAngle: CGFloat
    let endAngle: CGFloat
}

struct Segment: CustomStringConvertible {
    let name: String
    let value: Int
    let color: UIColor
    var description: String {
        return "\(self.name), \(self.value), \(self.color)"
    }
}
