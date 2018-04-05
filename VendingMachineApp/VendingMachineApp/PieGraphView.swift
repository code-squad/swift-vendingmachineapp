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

    override func draw(_ rect: CGRect) {
        UIColor.blue.setFill()
        UIColor.yellow.setStroke()
        let size = self.bounds
        let centerX = size.width / 2
        let centerY = size.height / 2
        let centerPoint = CGPoint(x: centerX, y: centerY)
        let radius = min(size.width, size.height) / 2
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




}
