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
    var color: UIColor {
        return category.makeColor
    }
    var value: CGFloat

    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.category == rhs.category
    }

    static func <(lhs: Piece, rhs: Piece) -> Bool {
        return lhs.category < rhs.category
    }
}
