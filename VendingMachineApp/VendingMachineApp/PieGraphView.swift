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

    override func draw(_ rect: CGRect) {
        UIColor.blue.setFill()
        UIColor.yellow.setStroke()

        let startAngle: CGFloat = 0
        let endAngle: CGFloat = CGFloat(120).degreesToRadians
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.addLine(to: centerPoint)
        path.close()
        path.lineWidth = 10.0
        path.stroke()
        path.fill()
    }

    private func drawPie() {
        var piePaths = [UIBezierPath]()

    }




}
