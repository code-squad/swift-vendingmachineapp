//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

typealias ContentsOfPiece = (
    center     : CGPoint,
    radius     : CGFloat,
    startAngle : CGFloat,
    endAngle   : CGFloat,
    clockwise  : Bool
)

class PieGraphView: UIView, EnableLine {
    enum GraphState {
        case none
        case hasContents
    }
    var pieces: [Piece] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    var graphState: GraphState = .hasContents {
        didSet {
            setNeedsDisplay()
        }
    }
    var touchPoint: CGPoint = CGPoint.zero
    var change: CGFloat = 0
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        switch graphState {
        case .none: context.drawCircle(view: self, color: UIColor.black)
        case .hasContents: context.drawPieGraph(pieces: self.pieces, view: self, change: change)
        }
    }
}

extension PieGraphView: Circular {
    var centerPoint: CGPoint {
        return CGPoint(
            x: self.bounds.size.width * 0.5,
            y: self.bounds.size.height * 0.5
        )
    }
    var radius: CGFloat {
        return min(self.frame.size.width, self.frame.size.height) * 0.5
    }
}

extension PieGraphView: EnableEvent {
    func changeRadius(pre: Double, next: Double, max: CGFloat, original: CGFloat, change: CGFloat) -> CGFloat? {
        if isOutOfBound(
            pre     : pre,
            next    : next,
            max     : max,
            original: original,
            change  : change) {
            return nil
        }
        if isBigger(pre: pre, next: next) {
            return original + change
        }
        return original - change
    }

    func isBigger(pre: Double, next: Double) -> Bool {
        return pre < next
    }

    func isOutOfBound(pre: Double, next: Double, max: CGFloat, original: CGFloat, change: CGFloat) -> Bool {
        if isBigger(pre: pre, next: next) {
            return max + original + change > max
        }
        return max + original - change < 0
    }

}

extension PieGraphView {
    // 검정색 원
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        self.touchPoint = touch.location(in: self)
        graphState = .none
    }

    // 크기 변화
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let current = touches.first!
        let currentTouchLocation = current.location(in: self)
        let nextDistance = distance(a: centerPoint, b: currentTouchLocation)
        let preDistance = distance(a: centerPoint, b: touchPoint)
        guard let willChange = changeRadius(
            pre     : preDistance,
            next    : nextDistance,
            max     : radius,
            original: self.change,
            change  : 5
            ) else { return }
        self.change = willChange
        self.touchPoint = currentTouchLocation
        graphState = .hasContents
    }

    // 변화 된 크기에서 색상 변경
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        pieces = PiecesFactory().changeColorOfPieces(with: pieces)
    }
}

protocol Circular {
    var radius: CGFloat { get }
    var centerPoint: CGPoint { get }
}

protocol EnableEvent {
    func changeRadius(
        pre      : Double,
        next     : Double,
        max      : CGFloat,
        original : CGFloat,
        change   : CGFloat
        ) -> CGFloat?
    func isBigger(pre: Double, next: Double) -> Bool
    func isOutOfBound(pre: Double, next: Double, max: CGFloat, original: CGFloat, change: CGFloat) -> Bool
}

protocol EnableLine {
    func distance(a: CGPoint, b: CGPoint) -> Double
}

extension EnableLine {
    func distance(a: CGPoint, b: CGPoint) -> Double {
        let temp = pow(Double(a.x - b.x), 2.0) + pow(Double(a.y - b.y), 2.0)
        return sqrt(temp)
    }
}

extension CGContext {
    private func drawPieGraphPiece(color: CGColor, contents: ContentsOfPiece) {
        self.setFillColor(color)
        self.move(to: contents.center)
        self.addArc(
            center: contents.center,
            radius: contents.radius,
            startAngle: contents.startAngle,
            endAngle: contents.endAngle,
            clockwise: contents.clockwise
        )
        self.fillPath()
    }

    func drawPieGraph(pieces: [Piece], view: Circular, change: CGFloat)  {
        let valueCount = pieces.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi * 0.5
        for piece in pieces {
            let i = pieces.index(of: piece) ?? pieces.endIndex
            let ratio = piece.value / valueCount
            let endAngle = startAngle + 2 * .pi * ratio
            let contents = ContentsOfPiece(view.centerPoint, view.radius + change, startAngle, endAngle, false)
            self.drawPieGraphPiece(color: piece.color.cgColor, contents: contents)
            let positon = CGRect(x: 0, y: 40 * i, width: 90, height: 30)
            piece.category.draw(position: positon, color: piece.color)
            startAngle = endAngle
        }
    }

    func drawCircle(view: Circular, color: UIColor) {
        self.beginPath()
        self.addArc(
            center: view.centerPoint,
            radius: view.radius,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: false
        )
        self.setFillColor(color.cgColor)
        self.fillPath()
    }
}

extension String {
    func draw(position: CGRect, color: UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle  :  paragraphStyle,
                          NSAttributedStringKey.foregroundColor :  color,
                          NSAttributedStringKey.font            :  UIFont.systemFont(ofSize: 20.0)]
        let attrString = NSAttributedString(string: self,
                                            attributes: attributes)

        let rt = position
        attrString.draw(in: rt)
    }
}
