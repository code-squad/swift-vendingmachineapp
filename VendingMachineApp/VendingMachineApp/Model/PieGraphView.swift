//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 29..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    @IBInspectable let graphColor = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.gray, UIColor.brown, UIColor.darkGray]
    var beverage = [String: Int]()
    private var numberOfBeverage: Int {
        var number = 0
        for data in beverage {
            number += data.value
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

    private struct Constants {
        static let arcWidth: CGFloat = 10
    }
    
    private func calculateAngle(endAngle: CGFloat, number: Int) -> CGFloat {
        print(numberOfBeverage)
        return endAngle + 2 * .pi * CGFloat(number / numberOfBeverage)
    }
    
    private func calculatePoint(center: CGPoint, startAngle: CGFloat, radius: CGFloat) -> CGPoint {
        let x1 = Int(center.x + cos(startAngle) * radius)
        let y1 = Int(center.y + sin(startAngle) * radius)
        return CGPoint(x: x1, y: y1)
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
            endAngle = calculateAngle(endAngle: endAngle, number: product.value)
            let point = calculatePoint(center: center, startAngle: startAngle, radius: radius)
            
            path.addLine(to: point)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.addLine(to: center)
            path.fill()
            path.close()
            
            startAngle = endAngle
        }
    }
}
