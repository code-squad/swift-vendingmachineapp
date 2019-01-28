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
        
        super.draw(rect)
        if isSizeChainging {
            let path = makePath(startAngle: 0, angleFromStartToEnd: .pi * 2)
            UIColor.black.setFill()
            path.fill()
        } else {
            guard let dataSource = dataSource else { return }
            let drawPieGraph = { [unowned self] (purchaseInfo: [Beverage]) -> Void in
                self.drawPieGraph(purchaseInfo)
            }
            dataSource.performByHistory(drawPieGraph)
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
//    MARK: Private
    
    private func drawPieGraph(_ historyOfPurchase: [Beverage]) {
        var purchaseInfo = [String: Int]()
        
        for beverage in historyOfPurchase {
            beverage.increaseEqualName(&purchaseInfo)
        }
        
        var colors: [UIColor] = [.black, .gray, .orange, .red, .purple, .blue,]
        let countOfAll = purchaseInfo.values.reduce(0) { $0 + $1 }
        var startAngle: CGFloat = 0
        
        for (name, count) in purchaseInfo {
            let angleFromStartToEnd = CGFloat(count) / CGFloat(countOfAll)  * .pi * 2
            let path = makePath(startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd)
            colors.popLast()?.setFill()
            path.fill()
            drawText(name: name, startAngle: startAngle, angleFromStartToEnd: angleFromStartToEnd / 2)
            startAngle += angleFromStartToEnd
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
    
    private func drawText(name: String, startAngle: CGFloat, angleFromStartToEnd: CGFloat) {
        
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                radius: bounds.width / 2 - self.radiusReductionAmount,
                                startAngle: startAngle,
                                endAngle: startAngle + angleFromStartToEnd,
                                clockwise: true)
        
        let x = (path.currentPoint.x - bounds.midX) / 2 + bounds.midX
        let y = (path.currentPoint.y - bounds.midY) / 2 + bounds.midY
        
        let fontSize: CGFloat = 16
        let pointToCetnerText = CGPoint(x: x - CGFloat(name.count) * (fontSize / 2),
                                        y: y - fontSize / 2)
        let text = name as NSString
        text.draw(at: pointToCetnerText,
                  withAttributes: [.font: UIFont.systemFont(ofSize: fontSize),
                                   .foregroundColor: UIColor.green])
    }
    
    //MARK: Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.isSizeChainging = true
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isSizeChainging = false
        setNeedsDisplay()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            self.isSizeChainging = false
            self.radiusReductionAmount = 0
            setNeedsDisplay()
        }
    }
}
