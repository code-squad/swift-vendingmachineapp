//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 29..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var graphColor = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.gray, UIColor.brown, UIColor.darkGray]
    private var beverage = [String: Int]()
    private var numberOfBeverage: Float {
        var number: Float = 0
        for data in beverage {
            number += Float(data.value)
        }
        return number
    }
    var pieDrawable: PieDrawable? {
        didSet {
            guard let data = pieDrawable?.sendData() else {
                return
            }
            self.beverage = data
        }
    }
    private var textAttributes: [NSAttributedStringKey: Any] = {
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.gray
        return [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.shadow: myShadow]
    }()

    private struct Constants {
        static let arcWidth: CGFloat = 10
    }
    
    private func calculateAngle(endAngle: CGFloat, number: Float) -> CGFloat {
        let angle = 2 * .pi * CGFloat(number / numberOfBeverage)
        let result = endAngle + angle
        return result
    }
    
    private func calculatePoint(center: CGPoint, startAngle: CGFloat, radius: CGFloat) -> CGPoint {
        let x1 = Int(center.x + cos(startAngle) * radius)
        let y1 = Int(center.y + sin(startAngle) * radius)
        return CGPoint(x: x1, y: y1)
    }
    
    private func calculateTextPoint(center: CGPoint, startAngle: CGFloat, endAngle: CGFloat, radius: CGFloat) -> CGPoint {
        let halfAngle = (endAngle + startAngle) / 2
        print(halfAngle)
        return calculatePoint(center: center, startAngle: halfAngle, radius: radius/2 + 0.5)
        
    }
    
    override func draw(_ rect: CGRect) {
        // 중심점과 반지름 계산
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)/2 - Constants.arcWidth/2
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        
        // 음료수 별 비율을 계산하여 그래프로 출력
        for (index, product) in beverage.enumerated() {
            let path = UIBezierPath()
            path.move(to: center)
            graphColor[index].setFill()
            endAngle = calculateAngle(endAngle: endAngle, number: Float(product.value))
            let point = calculatePoint(center: center, startAngle: startAngle, radius: radius)
            
            path.addLine(to: point)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: center)
            path.fill()
            path.close()
            
            // 글자 넣기
            let textPoint = calculateTextPoint(center: center, startAngle: startAngle, endAngle: endAngle, radius: radius)
            let textToRender: NSString = product.key as NSString
            
            var renderRect = CGRect(origin: .zero, size: textToRender.size(withAttributes: textAttributes))
            renderRect.origin = textPoint

            textToRender.draw(in: renderRect, withAttributes: textAttributes)
            
            startAngle = endAngle
        }
    }
}
