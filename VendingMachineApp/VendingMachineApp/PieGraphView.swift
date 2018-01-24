//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 19..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var graphRatio = 1.0
    private var totalCount = 0

    var beverageCounts: [Beverage: Int] = [:] {
        didSet { totalCount = beverageCounts.values.reduce(0, +) }
    }

    enum States {
        case none
        case began
        case moved
        case ended
    }

    private var state: States = .none {
        didSet { setNeedsDisplay() }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        switch state {
        case .none, .moved, .ended:
            drawPieChart(context: context, beverageCounts: beverageCounts)
        case .began:
            drawBaseBlackCircle(context: context)
        }
    }

    func shakeMotion() {
        graphRatio = 1.0
        state = .none
    }

    private func drawPieChart(context: CGContext, beverageCounts: [Beverage: Int]) {
        var startAngle: CGFloat = 0
        for (key, value) in beverageCounts {
            let endAngle = startAngle + 2 * .pi * (CGFloat(value) / CGFloat(totalCount))
            drawEachSegment(context: context, key: key, startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
        }
    }

    private func drawEachSegment(context: CGContext, key: Beverage, startAngle: CGFloat, endAngle: CGFloat) {
        let center = CGPoint(x: Int(frame.width * 0.5), y: Int(frame.height * 0.5))
        let radius = CGFloat(min(Double(frame.width * 0.5), Double(frame.height * 0.5)) * graphRatio)
        let color = getRandomColor()
        context.setFillColor(color)
        context.move(to: center)
        context.addArc(center: center, radius: radius,
                       startAngle: startAngle, endAngle: endAngle,
                       clockwise: false)
        context.fillPath()
        let textPositionAngle = getTextPositionAngle(startAngle: startAngle, endAngle: endAngle)
        let textPosition = getTextPosition(center: center, radius: radius, angle: textPositionAngle)
        drawTextOnChart(beverage: key, position: textPosition, color: color)
    }

    private func getRandomColor() -> CGColor {
        return UIColor.init(red: getRandomCGFloatForColor(),
                            green: getRandomCGFloatForColor(),
                            blue: getRandomCGFloatForColor(),
                            alpha: 1.0).cgColor
    }

    private func getRandomCGFloatForColor() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    private func getTextPositionAngle(startAngle: CGFloat, endAngle: CGFloat) -> CGFloat {
        return startAngle + (endAngle - startAngle) * 0.6
    }

    private func getTextPosition(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let positionRatio: CGFloat = 0.6
        return CGPoint(x: center.x + radius * positionRatio * cos(angle),
                       y: center.y + radius * positionRatio * sin(angle))
    }

    private func drawTextOnChart(beverage: Beverage, position: CGPoint, color: CGColor) {
        guard let colorComponents = color.components else { return }
        let averageRGB = (colorComponents[0] + colorComponents[1] + colorComponents[2]) / 3
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0),
                          NSAttributedStringKey.foregroundColor: (averageRGB > 0.7) ? UIColor.black : UIColor.white]
        let attrString = NSAttributedString(string: beverage.name,
                                            attributes: attributes)
        let renderRect = CGRect(origin: position, size: attrString.size())
        attrString.draw(in: renderRect)
    }

    private func drawBaseBlackCircle(context: CGContext) {
        let center = CGPoint(x: Int(frame.width * 0.5), y: Int(frame.height * 0.5))
        let radius = CGFloat(min(Double(frame.width * 0.5), Double(frame.height * 0.5)) * graphRatio)
        context.beginPath()
        context.addArc(center: center, radius: radius,
                       startAngle: 0.0, endAngle: 2 * .pi,
                       clockwise: false)
        context.setFillColor(UIColor.black.cgColor)
        context.fillPath()
    }

    /* Touch Events */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        state = .began
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let fingerLocation = touch.location(in: self)
        let xValue = pow(bounds.size.width * 0.5 - fingerLocation.x, 2)
        let yValue = pow(bounds.size.height * 0.5 - fingerLocation.y, 2)
        let distance = sqrt(xValue + yValue)
        graphRatio = Double(distance) / Double(bounds.size.width * 0.5)
        state = .moved
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        state = .ended
    }

}
