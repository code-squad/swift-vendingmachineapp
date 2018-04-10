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

    private var centerPoint: CGPoint {
        return CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
    }

    private var radius: CGFloat {
        return min(self.bounds.width, self.bounds.height) / 2
    }

    private var changeableRadius: CGFloat = 0.0

    private var arrangedHistory: [String:Int] {
        return history.reduce(into: [String:Int]()) { $0[$1.type, default: 0] += 1 }

    }

    private var endRadians: [String: CGFloat] {
        let radians = arrangedHistory.mapValues({
            CGFloat(Double($0) / Double(history.count) * degree).degreesToRadians
        })
        return radians
    }

    private let degree = 360.0
    private lazy var myFontSize: CGFloat = 23.0
    private lazy var myTextRect = CGSize(width: 130, height: 40)
    private lazy var pieColors = [UIColor.yellow, UIColor.red, UIColor.blue, UIColor.magenta, UIColor.orange, UIColor.green]

    enum DrawingType {
        case defaultGraph
        case blackCircle
        case redrawGraph
    }

    private var drawType: DrawingType = .defaultGraph

    override func draw(_ rect: CGRect) {
        switch drawType {
        case .defaultGraph:
            var startArc = CGFloat(0)
            var index = 0
            for itemName in endRadians.keys {
                let endArc = endRadians[itemName]!
                self.makePath(from: startArc, to: endArc, cIndex: index, radius: self.radius)

                let arc = self.getArcRadian(startArc: startArc, arc: endArc)
                makeLabelWithAttributes(of: itemName).draw(in: self.textRect(of: arc))

                index += 1
                startArc += endArc
            }
        case .blackCircle:
            self.drawBlackCircle(radius: self.changeableRadius)

        case .redrawGraph:
            var startArc = CGFloat(0)
            var index = 0
            for itemName in endRadians.keys {
                let endArc = endRadians[itemName]!
                self.makePath(from: startArc, to: endArc, cIndex: index, radius: self.changeableRadius)

                let arc = self.getArcRadian(startArc: startArc, arc: endArc)
                makeLabelWithAttributes(of: itemName).draw(in: self.textRect(of: arc))

                index += 1
                startArc += endArc
            }
        }

    }

    private func getArcRadian(startArc: CGFloat, arc: CGFloat) -> CGFloat {
        let endArc = startArc + arc
        let angle = (startArc + endArc) / 2
        return angle
    }

    private func makePath(from start: CGFloat, to endpoint: CGFloat, cIndex: Int, radius: CGFloat) -> UIBezierPath {
        pieColors[cIndex].setFill()
        let end = start + endpoint
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: start,
                                endAngle: end,
                                clockwise: true)
        path.addLine(to: centerPoint)
        path.close()
        path.fill()
        return path
    }

    private func makeLabelWithAttributes(of myText: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 2

        let customAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: myFontSize),
                                NSAttributedStringKey.foregroundColor: UIColor.white,
                                NSAttributedStringKey.shadow: shadow
                                ]

        let customText = NSAttributedString(string: myText,
                                            attributes: customAttributes)
        return customText
    }

    private func getOriginOfTextRect(_ radian: CGFloat) -> CGPoint {
        let halfRadius = self.radius / 2
        let adjustmentX: CGFloat = 75
        let adjustmentY: CGFloat = 25

        let pointX = (centerPoint.x + (cos(radian) * halfRadius)) - adjustmentX
        let pointY = (centerPoint.y + (sin(radian) * halfRadius)) - adjustmentY

        return CGPoint(x: pointX, y: pointY)
    }

    private func textRect(of radian: CGFloat) -> CGRect {
        let myOrigin = self.getOriginOfTextRect(radian)
        return CGRect(origin: myOrigin, size: self.myTextRect)
    }

    private func drawBlackCircle(radius: CGFloat) {
        UIColor.black.setStroke()
        UIColor.white.setFill()
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: CGFloat(degree).degreesToRadians,
                                clockwise: false)
        path.lineWidth = 5.0
        path.fill()
        path.stroke()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .blackCircle
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        changeableRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .blackCircle
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        changeableRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawType = .redrawGraph
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: self)
        changeableRadius = sqrt(pow((newLocation.x - centerPoint.x), 2) + pow((newLocation.y - centerPoint.y), 2))
        setNeedsDisplay()
    }

}
