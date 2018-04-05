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
    var endAngles: [Beverage: CGFloat]? {
        let arrangedList = historyData?.reduce(into: [Beverage:Int]()) {
            $0[$1, default: 0] += 1
        }
        let degrees = arrangedList?.mapValues({
            CGFloat(CGFloat($0) / CGFloat((historyData?.count)!) * 360)
        })

        return degrees
    }

    override func draw(_ rect: CGRect) {
        // BananaMilk
        var endpointOfPrevious = 90.degreesToRadians
        UIColor.blue.setFill()
        let path1 = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: endpointOfPrevious,
                                clockwise: true)
        path1.addLine(to: centerPoint)
        path1.close()
        path1.lineWidth = 10.0
        path1.fill()

        // ChocoMilk
        UIColor.red.setFill()
        let path2 = UIBezierPath(arcCenter: centerPoint,
                                 radius: radius,
                                 startAngle: endpointOfPrevious,
                                 endAngle: endpointOfPrevious + 30.degreesToRadians,
                                 clockwise: true)
        endpointOfPrevious += 30.degreesToRadians
        path2.addLine(to: centerPoint)
        path2.close()
        path2.lineWidth = 10.0
        path2.fill()

        // TOP
        UIColor.green.setFill()
        let path3 = UIBezierPath(arcCenter: centerPoint,
                                 radius: radius,
                                 startAngle: endpointOfPrevious,
                                 endAngle: endpointOfPrevious + 60.degreesToRadians,
                                 clockwise: true)
        endpointOfPrevious += 60.degreesToRadians
        path3.addLine(to: centerPoint)
        path3.close()
        path3.lineWidth = 10.0
        path3.fill()

        // DolceLatte


        // EnergyDrink


        // SoftDrink


    }

}
