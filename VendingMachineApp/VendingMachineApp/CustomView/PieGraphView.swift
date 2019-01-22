//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 18/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private let palette: [UIColor] = [UIColor(red:0.02, green:0.05, blue:0.17, alpha:1.0),
                                      UIColor(red:0.59, green:0.88, blue:0.88, alpha:1.0),
                                      UIColor(red:0.14, green:0.69, blue:0.70, alpha:1.0),
                                      UIColor(red:0.04, green:0.42, blue:0.45, alpha:1.0),
                                      UIColor(red:0.31, green:0.78, blue:0.80, alpha:1.0),
                                      UIColor(red:0.63, green:0.78, blue:0.75, alpha:1.0)]
    var historyDataSource: HistoryDataSource?
    private var touched: Bool = false
    private var radiusOfPie: CGFloat = 200
    private var centerOfPie: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    func setDefaultRadius() {
        radiusOfPie = 200
        setNeedsDisplay()
    }

    private func drawAPieceOfPie(startAngle: CGFloat, endAngle: CGFloat) {
        let path = UIBezierPath(arcCenter: centerOfPie,
                                radius: radiusOfPie,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.addLine(to: centerOfPie)
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

    private func drawPieGraph() {
        guard let classifiedPurchase = historyDataSource?.classifiedPurchase else { return }
        let total = classifiedPurchase.values.reduce(0) { $0 + $1 }
        var currentAngle: CGFloat = 0
        let randomPalette = palette.shuffled()
        for (index, purchase) in classifiedPurchase.enumerated() {
            randomPalette[index].setFill()
            let angle = purchase.value.convertedToAnglesInCircle(total: total)
            let endAngle = currentAngle + angle
            drawAPieceOfPie(startAngle: currentAngle, endAngle: endAngle)
            drawLabel(text: purchase.key as NSString, startAngle: currentAngle, endAngle: endAngle)
            currentAngle = endAngle
        }
    }

    private func drawDefaultCircle() {
        UIColor.black.setFill()
        drawAPieceOfPie(startAngle: 0, endAngle: .pi*2)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if touched {
            drawDefaultCircle()
        } else {
            drawPieGraph()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touched = true
        setNeedsDisplay()
    }

    private func resizeRadius(by point: CGPoint) -> Bool {
        let distance = point.distance(from: centerOfPie)
        if 50 < distance && distance < 200 {
            radiusOfPie = distance
            return true
        }
        return false
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let point = touches.first?.location(in: self) else { return }
        guard resizeRadius(by: point) else { return }
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touched = false
        setNeedsDisplay()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touched = false
        setNeedsDisplay()
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

extension CGPoint {

    func distance(from point: CGPoint) -> CGFloat {
        return sqrt(pow((self.x - point.x), 2) + pow((self.y - point.y), 2))
    }

}
