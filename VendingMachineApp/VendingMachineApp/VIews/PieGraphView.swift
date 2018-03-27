
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yuaming on 23/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

protocol PieGraphViewDataSource {
    func pieGraphView(_ pieGraphView: PieGraphView) -> PieGraphItem
}

struct PieGraphItem {
    private(set) var menu: String
    private(set) var value: CGFloat
    private var history: [String]
    
    init(_ history: [String]) {
        self.history = history
        self.menu = ""
        self.value = 0
    }
    
    func convert() -> [PieGraphItem] {
        var pieGraphItems = [PieGraphItem]()
        let menus = convertToMenu()
        
        for (key, value) in menus {
            pieGraphItems.append(PieGraphItem(menu: key, value: value))
        }
        
        return pieGraphItems
    }
    
    var total: CGFloat {
        return self.convert().reduce(0, {$0 + $1.value})
    }
}

private extension PieGraphItem {
    init(menu: String, value: CGFloat) {
        self.history = []
        self.menu = menu
        self.value = value
    }
    
    func convertToMenu() -> [String: CGFloat] {
        let result = history.map {
            return $0.split(separator: ",")[0].trimmingCharacters(in: .whitespaces)
        }
        
        return result.reduce([String: CGFloat]()) { key, count in
            var newKey = key
            newKey[count] = (newKey[count] ?? 0) + 1
            return newKey
        }
    }
}

class PieGraphView: UIView {
    var dataSource: PieGraphViewDataSource?
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
    }

    override func draw(_ rect: CGRect) {
        if let graphItem = self.dataSource?.pieGraphView(self) {
            drawPieGraphs(graphItem)
        }
    }
}

private extension PieGraphView {
    func drawPieGraphs(_ graphItem: PieGraphItem) {
        if let context = UIGraphicsGetCurrentContext() {
            let radius = min(frame.size.height, frame.size.height) * 0.5
            let valueCount = graphItem.total
            let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
            var startAngle = -CGFloat.pi * 0.5
            
            for item in graphItem.convert() {
                let endAngle = startAngle + 2 * .pi * (item.value / valueCount)

                context.setFillColor(randomColor())
                context.move(to: viewCenter)
                context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                context.fillPath()
                
                startAngle = endAngle
            }
        }
    }
    
    func randomColor() -> CGColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0).cgColor
    }
}

