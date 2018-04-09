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
    var centerX: CGFloat {
        return self.bounds.width / 2
    }
    var centerY: CGFloat {
        return self.bounds.height / 2
    }
    var centerPoint: CGPoint {
        return CGPoint(x: centerX, y: centerY)
    }
    var radius: CGFloat {
        return min(self.bounds.width, self.bounds.height) / 2
    }

    var arrangedHistory: [String:Int]? {
       return historyData?.reduce(into: [String:Int]()) { $0[$1.type, default: 0] += 1 }
    }

    var endAngles: [CGFloat]? {
        let angles: [String: CGFloat]? = arrangedHistory?.mapValues({CGFloat(CGFloat($0) / CGFloat((historyData?.count)!) * 360)
        })
        let endAngles = angles?.values.reduce(into: []) { $0.append(($0.last ?? 0) + $1) }
        return endAngles
    }

    var endRadians: [String: CGFloat]? {
        let radians = arrangedHistory?.mapValues({CGFloat(CGFloat($0) / CGFloat((historyData?.count)!) * 360).degreesToRadians
        })

        return radians
    }

    private lazy var myFontSize: CGFloat = 23.0
    private lazy var myTextRect = CGSize(width: 130, height: 40)
    private lazy var pieColors = [UIColor.yellow, UIColor.red, UIColor.blue, UIColor.magenta, UIColor.orange, UIColor.green]


    override func draw(_ rect: CGRect) {
        guard let radiansData = endRadians else {return}
        var startArc = CGFloat(0)
        var index = 0
        for list in radiansData.keys {
            let endArc = radiansData[list]!
            self.makePath(from: startArc, to: endArc, cIndex: index)

            let angle = self.drawText(text: list, startArc: startArc, arc: endArc)
            makeText(list).draw(in: self.textRect(angle))

            index += 1
            startArc += endArc
        }
    }

    private func drawText(text: String, startArc: CGFloat, arc: CGFloat) -> CGFloat {
        let endArc = startArc + arc
        let angle = (startArc + endArc) / 2
        return angle
    }

    private func makePath(from start: CGFloat, to endpoint: CGFloat, cIndex: Int) -> UIBezierPath {
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

    private func makeText(_ myText: String) -> NSAttributedString {
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

    private func coordinatesfromCentralAngle(_ angle: CGFloat) -> CGPoint {
        let halfR = self.radius / 2
        let adjustmentX: CGFloat = 75
        let adjustmentY: CGFloat = 25

        let pointX = (centerX + (cos(angle) * halfR)) - adjustmentX
        let pointY = (centerY + (sin(angle) * halfR)) - adjustmentY

        return CGPoint(x: pointX, y: pointY)
    }

    private func textRect(_ degree: CGFloat) -> CGRect {
        let myOrigin = self.coordinatesfromCentralAngle(degree)
        return CGRect(origin: myOrigin, size: self.myTextRect)
    }

}
