//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by oingbong on 18/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    
    struct Label {
        let name: String
        let startAngle: CGFloat
        let endAngle: CGFloat
        let radius: CGFloat
    }
    
    public var historyDataSource: HistoryDataSource?
    private var beverages = [Beverage: Int]()
    private var isBasicCircle = true
    private var radius = CGFloat(0)
    private var rectCenterPoint = CGPoint(x: 0, y: 0)
    private var startAngle = CGFloat(0)
    private var colorIndex = 0

    private let colors: [UIColor] = [.red, .orange, .blue, .green, .yellow, .brown, .purple, .magenta, .gray]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        radius = min(self.frame.size.width, self.frame.size.height) * 0.5
        rectCenterPoint = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        radius = min(self.frame.size.width, self.frame.size.height) * 0.5
        rectCenterPoint = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
    }
    
    override func draw(_ rect: CGRect) {
        guard let historyDataSource = self.historyDataSource else { return }
        let beverages = historyDataSource.list()
        let beveragesValue = beverages.reduce(0, {$0 + $1.value})
        
        guard isBasicCircle else {
            drawBlackCircle()
            return
        }
        
        for beverage in beverages {
            let endAngle = startAngle + 2 * .pi * (CGFloat(beverage.value) / CGFloat(beveragesValue))
            let path = UIBezierPath(arcCenter: rectCenterPoint,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            colors[colorIndex].setFill()
            colorIndex += 1
            path.addLine(to: rectCenterPoint)
            path.fill()
            let label = Label(name: beverage.key.beverageName(),
                              startAngle: startAngle,
                              endAngle: endAngle,
                              radius: radius)
            addTextLabel(with: label)
            
            startAngle = endAngle
        }
    }
    
    private func drawBlackCircle() {
        let path = UIBezierPath(arcCenter: rectCenterPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 360,
                                clockwise: true)
        UIColor.black.setFill()
        path.fill()
    }
    
    private func addTextLabel(with info: Label) {
        // NSString 변경해야 draw 가능합니다.
        let textToRender = info.name as NSString
        // 텍스트 설정값
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15,
                                                           weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let textRenderSize = textToRender.size(withAttributes: textAttributes)
        
        let halfAngle = info.startAngle + (info.endAngle - info.startAngle) * 0.5
        
        // 중앙에서부터의 떨어진 거리(?)
        let textPositionOffset: CGFloat = 0.67
        
        // 1. 원의 중앙을 잡아준 다음에
        // 2. locationCenter를 이용하여 원의 중앙에서부터 떨어진 텍스트 위치를 잡아줍니다.
        var segment = bounds.center
        segment = segment.locationCenter(by: info.radius * textPositionOffset,
                                         angle: halfAngle)
        
        // 1. 해당영역의 중앙의 좌표를 잡아줍니다.
        var renderRect = CGRect(origin: segment,
                                size: textRenderSize)
        // 2. 텍스트의 글자를 해당영역 중앙에 위치하도록 재설정합니다.
        // 즉, 5글자라면 3번째글자가 해당영역의 중앙좌표로 오도록 설정합니다.
        renderRect.origin = CGPoint(x: renderRect.origin.x - renderRect.size.width * 0.5,
                                    y: renderRect.origin.y - renderRect.size.height * 0.5)
        // 텍스트를 그려줍니다.
        textToRender.draw(in: renderRect,
                          withAttributes: textAttributes)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBasicCircle = false
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBasicCircle = true
        setNeedsDisplay()
    }
}

extension CGFloat {
    var toRadians: CGFloat {
        return self * .pi / 180.0
    }
}

extension CGRect {
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
}

extension CGPoint {
    func locationCenter(by value: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(
            x: x + value * cos(angle), y: y + value * sin(angle)
        )
    }
}
