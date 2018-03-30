
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yuaming on 23/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

protocol PieGraphViewDataSource {
    func bind(_ pieGraphView: PieGraphView) -> PieGraphItem
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
            return $0.split(separator: ",")[1].trimmingCharacters(in: .whitespaces)
        }
        
        return result.reduce([String: CGFloat]()) { key, count in
            var newKey = key
            newKey[count] = (newKey[count] ?? 0) + 1
            return newKey
        }
    }
}

class PieGraphView: UIView {
    var dataSource: PieGraphViewDataSource? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    private var isTouched: Bool = false

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let graphItem = self.dataSource?.bind(self) {
            drawPieGraph(graphItem)
        }
    }
}


// MARK: Touch events
extension PieGraphView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isTouched = true
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        isTouched = true
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        isTouched = false
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        isTouched = false
        setNeedsDisplay()
    }
}

// MARK: Draw a pie graph
private extension PieGraphView {
    func drawPieGraph(_ graphItem: PieGraphItem) {
        if let context = UIGraphicsGetCurrentContext() {
            let radius = min(frame.size.height, frame.size.height) * 0.5
            let valueCount = graphItem.total
            let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
            var startAngle = -CGFloat.pi * 0.5
            var index = 0
            
            for item in graphItem.convert() {
                let endAngle = startAngle + 2 * .pi * (item.value / valueCount)

                if isTouched {
                    context.setFillColor(UIColor.black.cgColor)
                } else {
                    context.setFillColor(PieGraphAttribute.pickColor(index))
                }
                
                context.move(to: viewCenter)
                context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                context.fillPath()
                
                drawText(startAngle, endAngle, radius, viewCenter, item)
                
                startAngle = endAngle
                index += 1
            }
        }
    }
    
    func drawText(_ startAngle: CGFloat, _ endAngle: CGFloat, _ radius: CGFloat, _ viewCenter: CGPoint, _ item: PieGraphItem) {
        let halfAngle = startAngle + (endAngle - startAngle) * 0.5
        let textPositionValue : CGFloat = 0.67
        let textCenter = CGPoint(x: viewCenter.x + radius * textPositionValue * cos(halfAngle), y: viewCenter.y + radius * textPositionValue * sin(halfAngle))
        let text = "\(item.menu): \(Formatter.ea(Int(item.value)).unit)"
        
        var renderRect = CGRect(origin: .zero, size: text.size(withAttributes: PieGraphAttribute.text))
        
        renderRect.origin = CGPoint(x: textCenter.x - renderRect.size.width * 0.5, y: textCenter.y - renderRect.size.height * 0.5)
        
        text.draw(in: renderRect, withAttributes: PieGraphAttribute.text)
    }
}

struct PieGraphAttribute {
    static var text: [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15, weight: .medium),
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }
    
    static func pickColor(_ index: Int) -> CGColor {
        let colors: [UIColor] = [UIColor.white, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.purple]
        return colors[index].cgColor
    }
}
