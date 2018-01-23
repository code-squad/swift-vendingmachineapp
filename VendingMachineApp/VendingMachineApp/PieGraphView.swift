//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 19..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    var purchaseList: [Beverage] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        var beverageCounts: [Beverage: Int] = [:]
        for beverage in purchaseList {
            if beverageCounts[beverage] == nil {
                beverageCounts[beverage] = 1
            } else {
                beverageCounts[beverage]! += 1
            }
        }
        drawContext(beverageCounts: beverageCounts)
    }

    private func drawContext(beverageCounts: [Beverage: Int]) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let center = CGPoint(x: Int(frame.width * 0.5), y: Int(frame.height * 0.5))
        let radius = CGFloat(min(Int(frame.width * 0.5), Int(frame.height * 0.5)))
        var startAngle: CGFloat = 0
        for (_, value) in beverageCounts {
            let endAngle = startAngle + 2 * .pi * (CGFloat(value) / CGFloat(purchaseList.count))
            context.setFillColor(getRandomColor())
            context.move(to: center)
            context.addArc(center: center, radius: radius,
                           startAngle: startAngle, endAngle: endAngle,
                           clockwise: false)
            context.fillPath()
            startAngle = endAngle
        }
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

}
