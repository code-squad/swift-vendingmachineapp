//
//  Piece.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 19..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

struct Piece: Comparable {
    var category: String
    var value: CGFloat

    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.category == rhs.category
    }

    static func <(lhs: Piece, rhs: Piece) -> Bool {
        return lhs.category < rhs.category
    }
}

struct ContentsForChangeRadius {
    var maxLength: CGFloat
    var originalLength: CGFloat
    var change: CGFloat
}

struct ContentsOfPiece {
    var center: CGPoint
    var radius: CGFloat
    var startAngle: CGFloat
    var endAngle: CGFloat
    var clockwise: Bool
}
