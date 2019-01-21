//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 18/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var purchases: [Beverage] = []
    private let palette: [UIColor] = [.green, .red, .blue, .yellow, .gray, .purple]

    var countOfPurchase: Int {
        return purchases.count
    }

    func updated(with beverages: ArraySlice<Beverage>) {
        beverages.forEach { purchases.append($0) }
    }

    private var classifiedPurchase: [String: Int] {
        return purchases.reduce(into: [:]) { $0[$1.title, default: 0] += 1 }
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = self.frame.width / 2
        let total = purchases.count
        var colorIndex = 0
        var currentAngle: CGFloat = 0
        for purchase in classifiedPurchase {
            let angle = purchase.value.convertedToAnglesInCircle(total: total)
            let endAngle = currentAngle + angle
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle: currentAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            currentAngle = endAngle
            palette[colorIndex].setFill()
            colorIndex += 1
            path.addLine(to: center)
            path.fill()
        }
    }

}

extension Int {

    func convertedToAnglesInCircle(total: Int) -> CGFloat {
        return 2 * .pi * ( CGFloat(self) / CGFloat(total) )
    }

}
