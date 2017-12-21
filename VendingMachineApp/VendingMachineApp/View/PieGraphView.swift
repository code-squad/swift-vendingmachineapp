//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class PieGraphView: UIView, EnableLine {
    enum GraphState {
        case none
        case began
        case moved
        case ended
    }
    var pieces: [Piece] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    var graphState: GraphState = .none {
        didSet {
            setNeedsDisplay()
        }
    }
    var touchPoint: CGPoint = CGPoint.zero
    var change: CGFloat = 0
    var myColor = Color()

    // MARK: Override

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        switch graphState {
        case .none, .moved: context.drawPieGraph(pieces: self.pieces, view: self, change: change, color: myColor.original)
        case .began: context.drawCircle(view: self, color: UIColor.black, change: change)
        case .ended: context.drawPieGraph(pieces: self.pieces, view: self, change: change, color: myColor.makeRandomColor())
        }
    }

    // MARK: Methods
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
    func changeRadius(pre: Double, next: Double, contents: ContentsForChangeRadius) -> CGFloat? {
        if isOutOfBound(pre: pre, next: next, contents: contents) {
            return nil
        }
        if isBigger(pre: pre, next: next) {
            return contents.originalLength + contents.change
        }
        return contents.originalLength - contents.change
    }

    func isBigger(pre: Double, next: Double) -> Bool {
        return pre < next
    }

    func isOutOfBound(pre: Double, next: Double, contents: ContentsForChangeRadius) -> Bool {
        if isBigger(pre: pre, next: next) {
            return contents.maxLength + contents.originalLength + contents.change > contents.maxLength
        }
        return contents.maxLength + contents.originalLength - contents.change < 0
    }

}

extension PieGraphView {
    // 검정색 원
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        self.touchPoint = touch.location(in: self)
        graphState = .began
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
            contents: ContentsForChangeRadius(
                maxLength       : radius,
                originalLength  : self.change,
                change          : 5
            )
            ) else { return }
        self.change = willChange
        self.touchPoint = currentTouchLocation
        graphState = .moved
    }

    // 변화 된 크기에서 색상 변경
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        graphState = .ended
    }
}

// 원의 속성을 가진 프로토콜
protocol Circular {
    var radius: CGFloat { get }
    var centerPoint: CGPoint { get }
}

// 이벤트 관련 메소드를 가진 프로토콜
protocol EnableEvent {
    func changeRadius(
        pre      : Double,
        next     : Double,
        contents : ContentsForChangeRadius
        ) -> CGFloat?
    func isBigger(pre: Double, next: Double) -> Bool
    func isOutOfBound(pre: Double, next: Double, contents: ContentsForChangeRadius) -> Bool
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
