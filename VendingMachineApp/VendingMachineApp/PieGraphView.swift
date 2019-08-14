//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by hw on 12/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit


class PieGraphView: UIView {
    private var historySet: [String: Int] = [String: Int]() {
        didSet {
            totalCount = calculateTotalCount()
            initializeColorSet()
        }
    }
    private var colorSet: [String: CGColor] = [String: CGColor]()
    private let colorList = [ UIColor.orange,
                              UIColor.init(red: 0.7, green: 0.0, blue: 0.7, alpha: 1),
                              UIColor.init(red: 0.1, green: 0.3, blue: 0.9, alpha: 1),
                              UIColor.init(red: 0, green: 0.8, blue: 0.2, alpha: 1),
                              UIColor.init(red: 0.9,green: 0.1, blue: 0, alpha: 1)
    ]
    private var initialAngle: CGFloat = -CGFloat.pi * 0.5
    private var frameSize: CGFloat = 0
    private var boundSize: CGFloat = 0
    private var radius: CGFloat = 0
    private var centerPoint: CGPoint!
    private var totalCount: Int = 0
    
    private let paragraphStyle: NSParagraphStyle = makeParagrapheStyle()
    
    private lazy var textAttributes: [NSAttributedString.Key: Any] = [
        .paragraphStyle: self.paragraphStyle,
        .font: UIFont.systemFont(ofSize: 20),
        .foregroundColor: UIColor.black
    ]
    
    private static func makeParagrapheStyle() -> NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style.mutableCopy() as! NSParagraphStyle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeDrawingProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeColorSet()
        initializeDrawingProperties()
        isOpaque = false
    }
    
    private func initializeDrawingProperties(){
        frameSize = min(frame.size.height, frame.size.width)
        boundSize = min(bounds.size.height, bounds.size.width)
        radius = frameSize * 0.5
        centerPoint = CGPoint(x: boundSize * 0.5, y: boundSize * 0.5)
        totalCount = calculateTotalCount()
    }
    
    private func initializeColorSet(){
        var colorIndex = 0
        historySet.forEach { (name: String, value: Int) in
            if colorSet[name] == nil {
                colorSet.updateValue(colorList[colorIndex].cgColor,
                                     forKey: name)
                colorIndex += 1
            }
        }
    }

    func configureDataSet(_ dataSet: [String: Int]){
        historySet = dataSet
    }
    
    private func calculateTotalCount() -> Int{
        let temporalMap = historySet.map{ (key: String, value: Int) ->
            Int in return value }
        let totalCount = temporalMap.reduce(0, {(value1: Int, value2: Int) ->
            Int in return value1+value2})
        return totalCount
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        makePieGraph(context: context, start: initialAngle, radius: radius,
                     center: centerPoint, totalCount: totalCount)
        makeLabelsForPieGraph(start: initialAngle, radius: radius,
                              center: centerPoint, totalCount: totalCount)
    }
    
    private func makePieGraph(context: CGContext, start: CGFloat, radius: CGFloat, center: CGPoint, totalCount: Int){
        var startAngle = start
        
        for drink in historySet.enumerated(){
            let endAngle = startAngle + 2 * .pi * (CGFloat(drink.element.value)/CGFloat(totalCount))
            drawArcsInPieGraph(drinkName: drink.element.key, context: context,
                              center: center, radius: radius,
                              startAngle: startAngle, endAngle: endAngle)
            startAngle = endAngle
        }
        addGlowGradient(context: context, center: center, radius: radius)
    }
    
    private func drawArcsInPieGraph(drinkName: String, context: CGContext, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        guard let currentCGColor = colorSet[drinkName] else{
            return
        }
        context.setFillColor(currentCGColor)
        context.move(to: center)
        context.addArc(center: center, radius: radius,
                       startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.fillPath()
    }
    
    private func addGlowGradient(context: CGContext, center: CGPoint, radius: CGFloat) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorComponents : [CGFloat] = [
            ///  R    G    B    A
            1.0, 1.0, 1.0, 0.8,
            0.9, 0.9, 0.9, 0.0,
        ]
        let locations : [CGFloat] = [0.1, 0.9]
        guard let glowGradient = CGGradient.init( colorSpace: colorSpace,
                                                  colorComponents: colorComponents,
                                                  locations: locations,
                                                  count: locations.count ) else { return }
        context.drawRadialGradient(glowGradient, startCenter: center,
                                   startRadius: 1, endCenter: center,
                                   endRadius: radius, options: [])
    }
    
    private func makeLabelsForPieGraph(start: CGFloat, radius: CGFloat, center: CGPoint, totalCount: Int){
        var startAngle = start
        for drink in historySet.enumerated(){
            let endAngle = startAngle + 2 * .pi * (CGFloat(drink.element.value)/CGFloat(totalCount))
            let halfAngle = startAngle + (endAngle - startAngle)/2
            //text attribute
            let labelText = drink.element.key as NSString
            let textRenderSize = labelText.size(withAttributes: textAttributes)
            let textLabelCenter = center
            // text rect size
            let rectOriginPoint = textLabelCenter.project(by: radius, center: center, angle: halfAngle)
            let rectCenterPoint = CGPoint.init(x: rectOriginPoint.x - textRenderSize.width * 0.5,
                                               y: rectOriginPoint.y - textRenderSize.height * 0.5)
            let textLabelRect = CGRect(origin: rectCenterPoint, size: textRenderSize)
            labelText.draw(in: textLabelRect, withAttributes: textAttributes)
            startAngle = endAngle
        }
    }
}

extension CGPoint {
    /// 중점 좌표로부터 보정된 반지름 만큼의 각도를 따라
    /// x방향으로 radius * cos(angle)
    /// y방향으로 radius * sin(angle)
    /// 만큼 떨어진 좌표를 text label의 origin 좌표로 둔다.
    func project(by radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let tunedRadius = 0.6 * radius
        let labelX = center.x + tunedRadius * cos(angle)
        let labelY = center.y + tunedRadius * sin(angle)
        let labelOriginPoint = CGPoint(x: labelX, y: labelY)
        return labelOriginPoint
    }
}
