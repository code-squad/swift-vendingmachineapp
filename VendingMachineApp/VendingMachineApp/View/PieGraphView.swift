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

class PieGraphView: UIView, Circular {
    enum TouchState {
        case none
        case began
        case move(CGFloat)
    }
    var pieces: [Piece] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    var touchState: TouchState = .none {
        didSet {
            setNeedsDisplay()
        }
    }
    var touchPoint: CGPoint = CGPoint.zero
    var flag: CGFloat = 0
    var radius: CGFloat {
        return min(self.frame.size.width, self.frame.size.height) * 0.5
    }
    var centerPoint: CGPoint {
        return CGPoint(
            x: self.bounds.size.width * 0.5,
            y: self.bounds.size.height * 0.5
        )
    }
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        switch touchState {
        case .began: context.drawCircle(view: self, color: UIColor.black)
        case .move(let flag): context.drawPieGraph(pieces: self.pieces, view: self, change: flag)
        case .none: context.drawPieGraph(pieces: self.pieces, view: self, change: 0)
        }

    }

    func distance(a: CGPoint, b: CGPoint) -> Double {
        let temp = pow(Double(a.x - b.x), 2.0) + pow(Double(a.y - b.y), 2.0)
        return sqrt(temp)
    }

}

extension PieGraphView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        self.touchPoint = touch.location(in: self)
        touchState = .began
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let current = touches.first!
        let currentTouchLocation = current.location(in: self)
        let centerToCurrent = distance(a: centerPoint, b: currentTouchLocation)
        let centerToPre = distance(a: centerPoint, b: touchPoint)
        // 커지기
        if centerToPre < centerToCurrent {
            if radius + flag + 5 < radius {
                flag += 5
            }
        }
        // 작아지기
        else {
            if radius + flag - 5 > 0 {
                flag -= 5
            }
        }
        self.touchPoint = currentTouchLocation
        touchState = .move(flag)

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        flag = 0
        touchState = .none
    }
}

protocol Circular {
    var radius: CGFloat { get }
    var centerPoint: CGPoint { get }
}

extension String {
    var makeColor: UIColor {
        switch self {
        case "딸기우유": return .red
        case "바나나우유": return .yellow
        case "초코우유": return .brown
        case "콜라": return .black
        case "사이다": return .blue
        case "환타": return .cyan
        case "TOP커피": return .gray
        case "조지아커피": return .orange
        case "칸타타커피": return .purple
        default: return .green
        }
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
