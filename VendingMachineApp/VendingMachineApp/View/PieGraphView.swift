//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 2019/11/19.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol PieDataSource: class {
    func categories(for pieGraph: PieGraphView) -> [Beverage]
    func numberOfTotal(for pieGraph: PieGraphView) -> Int
    func pieGraphView(_ pieGraphView: PieGraphView, numberForItemAt beverage: Beverage) -> Int
}

class PieGraphView: UIView {
    weak var dataSource: PieDataSource?
    private var radius: CGFloat {
        return bounds.width * 0.5
    }
    
    private var textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18.0, weight: .medium)
    ]
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        drawPie(at: center)
    }
    
    private func drawPie(at center: CGPoint) {
        var startAngle: CGFloat = 0.0
        var endAngle: CGFloat = 0.0
        
        guard let dataSource = dataSource else {
            return
        }
        
        let categories = dataSource.categories(for: self)
        let numOfTotal = dataSource.numberOfTotal(for: self)
        
        for category in categories {
            let numOfItem = dataSource.pieGraphView(self, numberForItemAt: category)

            let path = UIBezierPath()
            path.move(to: center)
            
            endAngle = startAngle + (CGFloat(numOfItem) / CGFloat(numOfTotal)) * .pi * 2
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            
            path.addArc(withCenter: center,
                        radius: radius,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: true)
            
            path.close()
            [UIColor.red, UIColor.green, UIColor.blue].randomElement()!.setFill()
            path.fill()
            UIColor.black.setStroke()
            path.stroke()
            
            drawText(category: category, center: center, angle: halfAngle)
            startAngle = endAngle
        }
    }
    
    private func drawText(category: Beverage, center: CGPoint, angle: CGFloat) {
        let itemNameText = category.itemName as NSString
        let labelX = center.x + radius * 0.5 * cos(angle)
        let labelY = center.y + radius * 0.5 * sin(angle)
        let textSize = itemNameText.size(withAttributes: textAttributes)
        let renderRect = CGRect(origin: CGPoint(x: labelX, y: labelY), size: textSize)
        itemNameText.draw(in: renderRect, withAttributes: textAttributes)
    }
}
