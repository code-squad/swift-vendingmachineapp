//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

struct Segment {
    var category: String
    // the color of a given segment
    var color: UIColor {
        return category.makeColor
    }
    // the value of a given segment – will be used to automatically calculate a ratio
    var value: CGFloat
}

@IBDesignable
class PieGraphView: UIView {
    var segments: [Segment] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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

            startAngle = endAngle
        }
    }

}

extension String {
    var makeColor: UIColor {
        switch self {
        case "딸기우유":
            return .red
        case "바나나우유":
            return .yellow
        case "초코우유":
            return .brown
        case "콜라":
            return .black
        case "사이다":
            return .blue
        case "환타":
            return .cyan
        case "TOP커피":
            return .gray
        case "조지아커피":
            return .orange
        case "칸타타커피":
            return .purple
        default:
            return .green
        }
    }
}
