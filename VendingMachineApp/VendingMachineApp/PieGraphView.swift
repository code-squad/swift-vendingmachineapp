//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 23..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

@IBDesignable
class PieGraphView: UIView {
    
    //MARK: - Properties
    
    weak var dataSource: PieGraphDataSource?
    
    //MARK: Private
    
    private var isSizeChainging: Bool = false
    private var radiusReductionAmount: CGFloat = 0
    
    //MARK: - Methods
    
    override func draw(_ rect: CGRect) {
        if isSizeChainging {
            let path = makePath(startAngle: 0, angleFromStartToEnd: .pi * 2)
            UIColor.black.setFill()
            path.fill()
        } else {
            makePieGraph()
        }
    }
    
    //MARK: Private
    
    private func makePieGraph() {
        guard let dataSource = self.dataSource else { return }
        let historyOfPurchase = dataSource.purchaseInfo()
        var colors: [UIColor] = [.black, .gray, .orange, .red, .purple, .blue,]
        let countOfAll = dataSource.numberOfHistory()
        var startAngle: CGFloat = 0
        
        for (name, count) in historyOfPurchase {
            let angleFromStartToEnd = CGFloat(count) / CGFloat(countOfAll)  * .pi * 2
            let path = makePath(startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd)
            colors.popLast()?.setFill()
            path.fill()
            let label = makeLabel(name: name, startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd / 2)
            startAngle += angleFromStartToEnd
            addSubview(label)
        }
    }
    
    private func makePath(startAngle: CGFloat, angleFromStartToEnd: CGFloat) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.width / 2 - self.radiusReductionAmount,
                    startAngle: startAngle,
                    endAngle: startAngle + angleFromStartToEnd,
                    clockwise: true)
        path.close()
        
        return path
    }
    
    private func makeLabel(name: String, startAngle: CGFloat, angleFromStartToEnd: CGFloat) -> UILabel {
        
        let label = UILabel()
        label.text = name
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.sizeToFit()
        
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                radius: bounds.width / 2 - self.radiusReductionAmount,
                                startAngle: startAngle,
                                endAngle: startAngle + angleFromStartToEnd,
                                clockwise: true)
        
        let x = (path.currentPoint.x - bounds.midX) / 2 + bounds.midX
        let y = (path.currentPoint.y - bounds.midY) / 2 + bounds.midY
        
        let position = CGPoint(x: x, y: y)
        label.center = position
        
        return label
    }
    
    //MARK: Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.isSizeChainging = true
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let location = touches.first?.location(in: self) else { return }
        let x = location.x - bounds.midX
        let y = location.y - bounds.midY
        let distance = hypot(x, y)
        let radiusReductionAmount = bounds.width / 2 - distance
        if radiusReductionAmount > 0 && radiusReductionAmount < 100 {
            self.radiusReductionAmount = radiusReductionAmount
        }
        setNeedsDisplay()
    }
}
