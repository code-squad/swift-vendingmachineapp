//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by hw on 12/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit


class PieGraphView: UIView {
    private var historySet: [String: Int] = [String: Int]()
    let colorList = [
        UIColor.orange,
        UIColor.init(red: 0.7, green: 0.0, blue: 0.7, alpha: 1),
        UIColor.init(red: 0.1, green: 0.3, blue: 0.9, alpha: 1),
        UIColor.init(red: 0, green: 0.8, blue: 0.2, alpha: 1),
        UIColor.init(red: 0.9,green: 0.1, blue: 0, alpha: 1)
    ]
    
    private static func makeParagrapheStyle() -> NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style.mutableCopy() as! NSParagraphStyle
    }
    
    private let paragraphStyle: NSParagraphStyle = makeParagrapheStyle()

    private lazy var textAttributes: [NSAttributedString.Key: Any] = [
        .paragraphStyle: self.paragraphStyle, .font: UIFont.systemFont(ofSize: 20)
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeHistorySet()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeHistorySet()
        isOpaque = false
    }
    
    
    func initializeHistorySet() {
        let list = VendingMachine.sharedInstance.showShoppingHistory().list
        for drink in list {
            guard let value = historySet[drink.name] else{
                historySet.updateValue(1, forKey: drink.name)
                continue
            }
            historySet.updateValue(value+1, forKey: drink.name)
        }
    }
    
    private func calculateTotalCount() -> Int{
        let temporalMap = historySet.map{ (key: String, value: Int) -> Int in return value }
        let totalCount = temporalMap.reduce(0, {(value1: Int, value2: Int) -> Int in return value1+value2})
        return totalCount
    }
    
    override func draw(_ rect: CGRect) {
        let initialAngle: CGFloat = -CGFloat.pi * 0.5

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let frameSize = min(frame.size.height, frame.size.width)
        let boundSize = min(bounds.size.height, bounds.size.width)
        let radius = frameSize * 0.5
        let center = CGPoint(x: boundSize * 0.5, y: boundSize * 0.5)   //원점
        
        let totalCount = calculateTotalCount()
        var startAngle = initialAngle

        var index = 0
        for drink in historySet.enumerated(){
            if index >= colorList.count {
                index = 0
            }
            
            context.setFillColor(colorList[index].cgColor)
            let endAngle = startAngle + 2 * .pi * (CGFloat(drink.element.value)/CGFloat(totalCount))
      
            context.move(to: center)
            context.addArc(center: center, radius: radius,
                       startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.fillPath()
            startAngle = endAngle
            index += 1
        }
        
        index = 0
        startAngle = initialAngle
        for drink in historySet.enumerated(){
            let endAngle = startAngle + 2 * .pi * (CGFloat(drink.element.value)/CGFloat(totalCount))
            let halfAngle = startAngle + (endAngle - startAngle)/2
            //text attribute
            let textLabel = drink.element.key as NSString
            let textRenderSize = textLabel.size(withAttributes: textAttributes)
            let textLabelCenter = center
            // text rect size          
            let rectOriginPoint = textLabelCenter.project(by: radius, center: center, angle: halfAngle)
            let rectCenterPoint = CGPoint.init(x: rectOriginPoint.x - textRenderSize.width * 0.5, y: rectOriginPoint.y - textRenderSize.height*0.5)
            let textRect = CGRect(origin: rectCenterPoint, size: textRenderSize)
            textAttributes[.foregroundColor] = UIColor.black
            textLabel.draw(in: textRect, withAttributes: textAttributes)
            index += 1
            startAngle = endAngle
        }
    }
}

extension CGPoint {
    /// 중점 좌표로부터 보정된 rad만큼의 각도를 따라
    /// x방향으로 radius * cos(angle)
    /// y방향으로 radius * sin(angle)
    /// 만큼 떨어진 좌표를 label의 중점좌표로 두기 위함.
    func project(by radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let tunedRadius = 0.6 * radius
        let labelX = center.x + tunedRadius * cos(angle)
        let labelY = center.y + tunedRadius * sin(angle)
        let labelCenter = CGPoint(x: labelX, y: labelY)
        return labelCenter
    }
}
