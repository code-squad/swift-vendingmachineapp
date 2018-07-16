//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 14..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class PieGraphView: UIView {

    private var countList = [String:Int]()
    private let colors = [UIColor.green, UIColor.orange, UIColor.red, UIColor.purple, UIColor.blue]
    private let lineWidth: CGFloat = 2

    private var totalCount: CGFloat {
        return CGFloat(countList.values.reduce(0, { $0 + $1}))
    }
    
    private var centerPoint: CGPoint {
        return CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    }
    
    private var radius: CGFloat {
        return max(bounds.width, bounds.height) / 2 - lineWidth
    }
    
    func setCountList(_ countList: [String:Int]) {
        self.countList = countList
    }
    
    override func draw(_ rect: CGRect) {
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        
        for (index, count) in countList.enumerated() {
            colors[index].setFill()
            endAngle = startAngle + (2 * .pi * CGFloat(count.value) / totalCount)
            drawPie(startAngle, endAngle)
            startAngle = endAngle
        }
    }
    
    private func drawPie(_ startAngle: CGFloat, _ endAngle: CGFloat) {
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius - lineWidth,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = lineWidth
        path.addLine(to: centerPoint)
        path.close()
        path.stroke()
        path.fill()
    }
}
