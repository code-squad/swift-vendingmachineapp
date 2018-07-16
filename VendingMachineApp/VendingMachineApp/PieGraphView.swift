//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 14..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    
    var dataSource: PieGraphViewDataSource!
    
    private let colors = [UIColor.green, UIColor.orange, UIColor.red, UIColor.purple, UIColor.blue]
    private let lineWidth: CGFloat = 0
    private let textShadow: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray
        shadow.shadowBlurRadius = 3
        return shadow
    }()

    private var totalCount: CGFloat {
        return CGFloat(dataSource.countList.values.reduce(0, { $0 + $1}))
    }
    
    private var centerPoint: CGPoint {
        return CGPoint(x: bounds.width / 2, y: bounds.height / 2)
    }
    
    private var radius: CGFloat {
        return max(bounds.width, bounds.height) / 2 - lineWidth
    }
    
    override func draw(_ rect: CGRect) {
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        
        for (index, count) in dataSource.countList.enumerated() {
            colors[index].setFill()
            endAngle = startAngle + (2 * .pi * CGFloat(count.value) / totalCount)
            drawPie(startAngle, endAngle)
            let sectionName = NSString(string: count.key)
            addSectionText(sectionName, startAngle, endAngle)
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
    
    private func addSectionText(_ text: NSString, _ startAngle: CGFloat, _ endAngle: CGFloat) {
        let textPoint = CGPoint(x: centerPoint.x + radius * 0.6 * cos((endAngle + startAngle) / 2 ) - (text.size(withAttributes: nil).width / 2),
                                y: centerPoint.y + radius * 0.6 * sin((endAngle + startAngle) / 2))
        text.draw(at: textPoint, withAttributes: [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20),
                                                  NSAttributedStringKey.shadow: textShadow])
    }
}
