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
