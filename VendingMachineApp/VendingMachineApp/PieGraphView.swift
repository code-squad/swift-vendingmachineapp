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
    }
}
