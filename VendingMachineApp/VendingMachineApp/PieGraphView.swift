//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 19..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var beverageCounts: [Beverage: Int] = [:]

    var purchaseList: [Beverage] = [] {
        didSet {
            countProductsFromPurchaseList()
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        drawContext(beverageCounts: beverageCounts)
    }

    private func countProductsFromPurchaseList() {
        for beverage in purchaseList {
            if beverageCounts[beverage] == nil {
                beverageCounts[beverage] = 1
            } else {
                beverageCounts[beverage]! += 1
            }
        }
    }

    private func drawContext(beverageCounts: [Beverage: Int]) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        var startAngle: CGFloat = 0
        for (key, value) in beverageCounts {
            let endAngle = startAngle + 2 * .pi * (CGFloat(value) / CGFloat(purchaseList.count))
            drawEachSegment(context: context, key: key, startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
        }
    }

    private func drawEachSegment(context: CGContext, key: Beverage, startAngle: CGFloat, endAngle: CGFloat) {
        let center = CGPoint(x: Int(frame.width * 0.5), y: Int(frame.height * 0.5))
        let radius = CGFloat(min(Int(frame.width * 0.5), Int(frame.height * 0.5)))
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

}
