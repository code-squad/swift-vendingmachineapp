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
        var startArc = CGFloat(0)
        var index = 0
        for list in radiansData.keys {
            let endArc = radiansData[list]!
            self.makePath(from: startArc, to: endArc, cIndex: index)

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






}
