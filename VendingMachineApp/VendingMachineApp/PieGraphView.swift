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

    var angles: [String: CGFloat]? {
        let arrangedList = historyData?.reduce(into: [String:Int]()) {
            $0[$1.type, default: 0] += 1
        }
        let angles = arrangedList?.mapValues({CGFloat(CGFloat($0) / CGFloat((historyData?.count)!) * 360)
        })
        return angles
    }

    var endRadians: [String: CGFloat]? {
        let arrangedList = historyData?.reduce(into: [String:Int]()) {
            $0[$1.type, default: 0] += 1
        }
        let radians = arrangedList?.mapValues({CGFloat(CGFloat($0) / CGFloat((historyData?.count)!) * 360).degreesToRadians
        })

        return radians
    }

    let pieColors = [UIColor.yellow, UIColor.brown, UIColor.blue, UIColor.cyan, UIColor.purple, UIColor.green]


    override func draw(_ rect: CGRect) {
        guard let radiansData = endRadians else {return}
        guard let anglesData = angles else {return}
        var startArc = CGFloat(0)
        var index = 0
        for list in radiansData.keys {
            let endArc = radiansData[list]!
            self.makePath(from: startArc, to: endArc, cIndex: index)
            makeText(list).draw(in: self.textRect(anglesData[list]!))
            index += 1
            startArc += endArc
        }
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

        let customAttributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23.0),
                                NSAttributedStringKey.foregroundColor: UIColor.white,
                                ]

        let customText = NSAttributedString(string: myText,
                                            attributes: customAttributes)
        return customText
    }

    private func coordinatesfromCentralAngle(_ degree: CGFloat) -> (x: CGFloat, y: CGFloat) {
        let halfDegree = degree / 2

        let pointX = CGFloat(sin(halfDegree * .pi / 180)) * self.radius
        let pointY = CGFloat(cos(halfDegree * .pi / 180)) * self.radius
        return (x: pointX, y: pointY)
    }


    private func textRect(_ degree: CGFloat) -> CGRect {
        let point = self.coordinatesfromCentralAngle(degree)
        return CGRect(x: point.x, y: point.x, width: 200, height: 200)
    }

}
