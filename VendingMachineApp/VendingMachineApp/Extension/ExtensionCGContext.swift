//
//  ExtensionCGContext.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 21..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

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
            let contents = ContentsOfPiece(
                center: view.centerPoint,
                radius: view.radius + change,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: false
            )
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
