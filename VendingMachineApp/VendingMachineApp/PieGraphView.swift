//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Elena on 02/07/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    // MARK: - private
    private let colors: [UIColor] = [UIColor.red, UIColor.blue,
                                     UIColor(red:0.50, green:0.40, blue:0.70, alpha:1.0),
                                     UIColor.gray,
                                     UIColor(red:0.30, green:0.50, blue:0.90, alpha:1.0)]
    
    private var pi: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    // MARK: - var
    var historyDataSource: HistoryDataSource?
    
    // MARK: - override func draw
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let classifiedPurchase = historyDataSource?.purchaseClassName else { return }
        let total = classifiedPurchase.values.reduce(0) { $0 + $1 }
        var startAngle: CGFloat = 0
        for (index, purchase) in classifiedPurchase.enumerated() {
            colors[index].setFill()
            let endAngle = startAngle + 2 * .pi * ( CGFloat(purchase.value) / CGFloat(total) )
            let rendering = UIBezierPath(arcCenter: pi, radius: (bounds.width * 0.5),
                                         startAngle: startAngle, endAngle: endAngle,
                                         clockwise: true)
            rendering.addLine(to: pi)
            rendering.fill()
            drawLabel(text: purchase.key as NSString, startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
        }
    }
    
    // MARK: - private func
    private func drawLabel(text: NSString, startAngle: CGFloat, endAngle: CGFloat) {
        let fontSize = CGFloat(20)
        let angle = startAngle + (endAngle - startAngle) * 0.5
        let movingUp = fontSize * 0.5
        let movingLeft = text.size(withAttributes: nil).width * 0.75
        let point = CGPoint(x: pi.x + (bounds.width * 0.5) * 0.65 * cos(angle) - movingLeft,
                            y: pi.y + (bounds.width * 0.5) * 0.65 * sin(angle) - movingUp)
        text.draw(at: point, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize),
                                              NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    
}
