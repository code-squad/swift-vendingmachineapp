//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 18/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var purchases: [Beverage] = []
    private let palette: [UIColor] = [UIColor(red:0.02, green:0.05, blue:0.17, alpha:1.0),
                                      UIColor(red:0.59, green:0.88, blue:0.88, alpha:1.0),
                                      UIColor(red:0.14, green:0.69, blue:0.70, alpha:1.0),
                                      UIColor(red:0.04, green:0.42, blue:0.45, alpha:1.0),
                                      UIColor(red:0.31, green:0.78, blue:0.80, alpha:1.0),
                                      UIColor(red:0.63, green:0.78, blue:0.75, alpha:1.0)]
    var historyDataSource: HistoryDataSource?

    private func updateHistory() {
        guard let beverages = historyDataSource?.update(from: purchases.count) else { return }
        beverages.forEach { purchases.append($0) }
    }

    private var classifiedPurchase: [String: Int] {
        return purchases.reduce(into: [:]) { $0[$1.title, default: 0] += 1 }
    }

    private var centerOfPie: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    private var radiusOfPie: CGFloat {
        return bounds.width.half
    }

    private func drawAPieceOfPie(startAngle: CGFloat, endAngle: CGFloat) {
        let path = UIBezierPath(arcCenter: centerOfPie,
                                radius: radiusOfPie,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.addLine(to: centerOfPie)
        path.close()
        path.fill()
    }

    private func drawLabel(text: NSString, startAngle: CGFloat, endAngle: CGFloat) {
        let fontSize = CGFloat(20)
        let angle = startAngle + (endAngle - startAngle).half
        let movingUp = fontSize.half
        let movingLeft = text.size(withAttributes: nil).width * 0.75
        let point = CGPoint(x: centerOfPie.x + radiusOfPie * 0.65 * cos(angle) - movingLeft,
                            y: centerOfPie.y + radiusOfPie * 0.65 * sin(angle) - movingUp)
        text.draw(at: point, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize),
                                              NSAttributedString.Key.foregroundColor: UIColor.white])
    }

    override func draw(_ rect: CGRect) {
        updateHistory()
        var currentAngle: CGFloat = 0
        for (index, purchase) in classifiedPurchase.enumerated() {
            palette[index].setFill()
            let angle = purchase.value.convertedToAnglesInCircle(total: purchases.count)
            let endAngle = currentAngle + angle
            drawAPieceOfPie(startAngle: currentAngle, endAngle: endAngle)
            drawLabel(text: purchase.key as NSString, startAngle: currentAngle, endAngle: endAngle)
            currentAngle = endAngle
        }
    }

}

extension Int {

    func convertedToAnglesInCircle(total: Int) -> CGFloat {
        return 2 * .pi * ( CGFloat(self) / CGFloat(total) )
    }

}

extension CGFloat {

    var half: CGFloat {
        return self * 0.5
    }

}
