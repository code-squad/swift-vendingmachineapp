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
    
    private var beverages = [String: Int]()
    private let adminMode = AdminMode(with: VendingMachine.shared)
    private let colors: [UIColor] = [.red, .orange, .blue, .green, .yellow, .brown, .purple, .magenta, .gray]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func sorted(with purchasedList: [Beverage]) {
        var beverages = [String: Int]()
        for beverage in purchasedList {
            if let beverageCount = beverages[beverage.beverageName()] {
                beverages.updateValue(beverageCount + 1, forKey: beverage.beverageName())
                continue
            }
            beverages.updateValue(1, forKey: beverage.beverageName())
        }
        self.beverages = beverages
    }
    
    override func draw(_ rect: CGRect) {
        let radius = min(self.frame.size.width, self.frame.size.height) * 0.5
        let center = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        let beveragesValue = beverages.reduce(0, {$0 + $1.value})
        
        var startAngle = CGFloat(0)
        var index = 0
        
        for beverage in beverages {
            let endAngle = startAngle + 2 * .pi * (CGFloat(beverage.value) / CGFloat(beveragesValue))
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            colors[index].setFill()
            index += 1
            path.addLine(to: center)
            path.fill()
            let label = Label(name: beverage.key,
                              startAngle: startAngle,
                              endAngle: endAngle,
                              radius: radius)
            addTextLabel(with: label)
            
            startAngle = endAngle
        }
        setNeedsDisplay()
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
