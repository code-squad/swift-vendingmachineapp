//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

typealias ContentsOfPiece = (center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)

class PieGraphView: UIView {
    var pieces: [Piece] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    var radius: CGFloat {
        return min(self.frame.size.width, self.frame.size.height) * 0.5
    }
    var centerPoint: CGPoint {
        return CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
    }

    override func draw(_ rect: CGRect) {

        if let context = UIGraphicsGetCurrentContext() {
            let radius = self.radius
            let viewCenter = self.centerPoint

            let valueCount = pieces.reduce(0, {$0 + $1.value})
            var startAngle = -CGFloat.pi * 0.5
            for piece in pieces.enumerated() {
                let ratio = piece.element.value / valueCount
                let endAngle = startAngle + 2 * .pi * ratio
                let contents = ContentsOfPiece(viewCenter, radius, startAngle, endAngle, false)

                context.drawPieGraphPieces(color: piece.element.color.cgColor, contents: contents)
                let positon = CGRect(x: 0, y: 40 * piece.offset, width: 90, height: 30)
                draw(piece.element.category, position: positon, color: piece.element.color)
                startAngle = endAngle
            }
        }


    }

    private func draw(_ string: String, position: CGRect, color: UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.paragraphStyle  :  paragraphStyle,
                          NSAttributedStringKey.foregroundColor :  color,
                          NSAttributedStringKey.font            :  UIFont.systemFont(ofSize: 20.0)]
        let myText = string
        let attrString = NSAttributedString(string: myText,
                                            attributes: attributes)

        let rt = position

        attrString.draw(in: rt)
    }

}

struct Piece {
    var category: String
    var color: UIColor {
        return category.makeColor
    }
    var value: CGFloat
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
    func drawPieGraphPieces(color: CGColor, contents: ContentsOfPiece) {
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
}
