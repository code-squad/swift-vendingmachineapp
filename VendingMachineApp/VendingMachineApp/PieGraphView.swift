//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 4. 4..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class PieGraphView: UIView {

    var historyData: [Beverage]?

    private var history: [Beverage] {
        guard let history = historyData else { return [Beverage]() }
        return history
    }

    private var arrangedHistory: [String:Int] {
        return history.reduce(into: [String:Int]()) { $0[$1.type, default: 0] += 1 }
    }

    private var endRadians: [String: CGFloat] {
        let radians = arrangedHistory.mapValues({
            CGFloat(Double($0) / Double(history.count) * degree).degreesToRadians
        })
        return radians
    }

    private var centerPoint: CGPoint {
        return CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
    }

    private var radius: CGFloat {
        return min(self.bounds.width, self.bounds.height) / 2
    }

    private var ratioOfNewRadius: CGFloat {
        guard self.drawType == .redrawGraph else {
            return 1.0
        }
        return self.newRadius / self.radius
    }

    private var drawType: DrawType = .defaultGraph
    private var newRadius: CGFloat = 0.0
    private let degree = 360.0
    private lazy var myFontSize: CGFloat = 23.0
    private lazy var myTextRect = CGSize(width: 130, height: 40)


    // MARK: Draw and Make the graph

    override func draw(_ rect: CGRect) {
        switch drawType {
        case .defaultGraph:
            var startArc = CGFloat(0)
            var index = 0
            let colorNumber = Int(arc4random_uniform(UInt32(PieColors.allValues.count)))

            for itemName in endRadians.keys {
                let endArc = endRadians[itemName]!
                self.makePath(from: startArc,
                              to: endArc,
                              colorIndex: index,
                              radius: self.radius,
                              colorNumber: colorNumber)

                let arc = self.getArcRadian(from: startArc, to: endArc)
                makeTextWithAttributes(of: itemName).draw(in: self.textRect(of: arc))

                index += 1
                startArc += endArc
            }

        case .redrawGraph:
            var startArc = CGFloat(0)
            var index = 0
            let colorNumber = Int(arc4random_uniform(UInt32(PieColors.allValues.count)))

            for itemName in endRadians.keys {
                let endArc = endRadians[itemName]!
                self.makePath(from: startArc,
                              to: endArc,
                              colorIndex: index,
                              radius: self.newRadius,
                              colorNumber: colorNumber)

                let arc = self.getArcRadian(from: startArc, to: endArc)
                makeTextWithAttributes(of: itemName).draw(in: self.textRect(of: arc))

                index += 1
                startArc += endArc
            }

        case .blackCircle:
            self.drawBlackCircle(radius: self.newRadius)
        }
    }

    private func getArcRadian(from start: CGFloat, to end: CGFloat) -> CGFloat {
        let endArc = start + end
        let angle = (start + endArc) / 2
        return angle
    }

    private func makePath(from start: CGFloat,
                          to endpoint: CGFloat,
                          colorIndex: Int,
                          radius: CGFloat,
                          colorNumber: Int)
    {
        let pieColors = PieColors.allValues[colorNumber].colorList
        pieColors[colorIndex].setFill()
        UIColor.white.setStroke()
        let end = start + endpoint
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: start,
                                endAngle: end,
                                clockwise: true)
        path.addLine(to: centerPoint)
        path.close()
        path.lineWidth = 1.0
        path.fill()
        path.stroke()
    }

    private func drawBlackCircle(radius: CGFloat) {
        UIColor.black.setStroke()
        UIColor.white.setFill()
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: CGFloat(degree).degreesToRadians,
                                clockwise: false)
        path.lineWidth = 3.0
        path.fill()
        path.stroke()
    }

     // MARK: Make Text(Labels of the graph)

    private func makeTextWithAttributes(of myText: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 2

        let customAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: myFontSize * ratioOfNewRadius),
                                NSAttributedStringKey.foregroundColor: UIColor.white,
                                NSAttributedStringKey.shadow: shadow
                                ]

        let customText = NSAttributedString(string: myText,
                                            attributes: customAttributes)
        return customText
    }

    private func textRect(of radian: CGFloat) -> CGRect {
        guard self.drawType == .redrawGraph else {
            let myOrigin = self.getOriginOfTextRect(radian: radian, currentRadius: self.radius)
            return CGRect(origin: myOrigin, size: self.myTextRect)
        }
        let myOrigin = self.getOriginOfTextRect(radian: radian, currentRadius: self.newRadius)
        return CGRect(origin: myOrigin, size: self.myTextRect)
    }

    private func getOriginOfTextRect(radian: CGFloat, currentRadius: CGFloat) -> CGPoint {
        let halfRadius = currentRadius / 2
        let adjustmentX: CGFloat = 75 * ratioOfNewRadius
        let adjustmentY: CGFloat = 25 * ratioOfNewRadius

        let pointX = (centerPoint.x + (cos(radian) * halfRadius)) - adjustmentX
        let pointY = (centerPoint.y + (sin(radian) * halfRadius)) - adjustmentY

        return CGPoint(x: pointX, y: pointY)
    }

    // MARK: Touch events

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .blackCircle
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        newRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .blackCircle
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        newRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .redrawGraph

        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        newRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

}
