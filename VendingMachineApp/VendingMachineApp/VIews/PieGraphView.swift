
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yuaming on 23/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import UIKit

protocol PieGraphViewDataSource {
    func changeContent(_ pieGraphView: PieGraphView) -> PieGraphItem
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
    
    private var radius: CGFloat = 0
    private var startAngle = -CGFloat.pi * 0.5
    private var scale: CGFloat = 0.2
    private var isTouched: Bool = false
    private var viewCenter: CGPoint = CGPoint()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let graphItem = self.dataSource?.changeContent(self) {
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
        
        if let touch = touches.first {
            let position = touch.location(in: self)
            let xDistance = pow(bounds.size.width * 0.5 - position.x, 2)
            let yDistance = pow(bounds.size.width * 0.5 - position.y, 2)
            let distance = sqrt(xDistance + yDistance)
            
            switch distance / 100 {
            case ..<0.2:
                scale = 0.2
            case 0.5...:
                scale = 0.5
            default:
                scale = distance / 100
            }
        }
        
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
    func getCurrentContext() -> CGContext? {
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        radius = min(frame.size.height, frame.size.height) * scale
        return context
    }
    
    func drawPieGraph(_ graphItem: PieGraphItem) {
        if let context = getCurrentContext() {
            var index = 0
            let valueCount = graphItem.total
            
            for item in graphItem.convert() {
                let endAngle = startAngle + 2 * .pi * (item.value / valueCount)
                
                if isTouched {
                    context.setFillColor(PieGraphAttribute.showColorWhenTouching())
                } else {
                    context.setFillColor(PieGraphAttribute.pickColor(index))
                }
                
                context.move(to: viewCenter)
                context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                context.fillPath()
                
                drawText(endAngle, item)
                
                startAngle = endAngle
                index += 1
            }
        }
    }
    
    func drawText(_ endAngle: CGFloat, _ item: PieGraphItem) {
        let halfAngle = startAngle + (endAngle - startAngle) * 0.5
        let textCenter = CGPoint(x: viewCenter.x + radius * PieGraphAttribute.textPositionValue * cos(halfAngle), y: viewCenter.y + radius * PieGraphAttribute.textPositionValue * sin(halfAngle))
        let text = "\(item.menu): \(Formatter.ea(Int(item.value)).unit)"
        var renderRect = CGRect(origin: .zero, size: text.size(withAttributes: PieGraphAttribute.text))
        
        renderRect.origin = CGPoint(x: textCenter.x - renderRect.size.width * 0.5, y: textCenter.y - renderRect.size.height * 0.5)
        
        text.draw(in: renderRect, withAttributes: PieGraphAttribute.text)
    }
}

struct PieGraphAttribute {
    static let textPositionValue: CGFloat = 0.67
    
    static var text: [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15, weight: .medium),
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }
    
    static func pickColor(_ index: Int) -> CGColor {
        let colors: [UIColor] = [UIColor.white, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.magenta, UIColor.purple]
        return colors[index].cgColor
    }
    
    static func showColorWhenTouching() -> CGColor {
        return UIColor.black.cgColor
    }
}
