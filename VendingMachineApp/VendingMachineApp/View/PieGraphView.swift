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
    private var palette = [UIColor.systemPink, UIColor.systemOrange, UIColor.systemPurple, UIColor.systemYellow, UIColor.systemGreen, UIColor.systemBlue]
    private var radius: CGFloat {
        return bounds.width * 0.5
    }
    
    private var textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18.0, weight: .medium)
    ]
    
    override func draw(_ rect: CGRect) {
        let viewCenter = CGPoint(x: rect.midX, y: rect.midY)
        drawPie(at: viewCenter)
    }
    
    private func drawPie(at viewCenter: CGPoint) {
        guard let dataSource = dataSource else {
            return
        }
        
        var startAngle: CGFloat = 0.0
        var endAngle: CGFloat = 0.0
        let categories = dataSource.categories(for: self)
        let numOfTotal = dataSource.numberOfTotal(for: self)
        
        for category in categories {
            let numOfItem = dataSource.pieGraphView(self, numberForItemAt: category)
            
            let path = UIBezierPath()
            path.move(to: viewCenter)
            
            endAngle = startAngle + (CGFloat(numOfItem) / CGFloat(numOfTotal)) * .pi * 2
            let halfAngle = startAngle + (endAngle - startAngle) * 0.5
            
            path.addArc(withCenter: viewCenter,
                        radius: radius,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: true)
            path.close()
            
            palette.popLast()?.set()
            path.fill()
            
            drawText(category: category, viewCenter: viewCenter, angle: halfAngle)
            startAngle = endAngle
        }
    }
    
    private func drawText(category: Beverage, viewCenter: CGPoint, angle: CGFloat) {
        let itemNameText = category.itemName as NSString
        let halfPoint = calculateHalfPoint(of: angle, viewCenter: viewCenter)
        let renderRect = calculateRenderRect(text: itemNameText, from: halfPoint)
        itemNameText.draw(in: renderRect, withAttributes: textAttributes)
    }
    
    private func calculateHalfPoint(of angle: CGFloat, viewCenter: CGPoint) -> CGPoint {
        let labelX = viewCenter.x + radius * 0.5 * cos(angle)
        let labelY = viewCenter.y + radius * 0.5 * sin(angle)
        return CGPoint(x: labelX, y: labelY)
    }
    
    private func calculateRenderRect(text: NSString, from point: CGPoint) -> CGRect {
        let textSize = text.size(withAttributes: textAttributes)
        let renderPoint = CGPoint(x: point.x - textSize.width * 0.5, y: point.y - textSize.height * 0.5)
        let renderRect = CGRect(origin: renderPoint, size: textSize)
        return renderRect
    }
}
