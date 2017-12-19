//
//  PiecesFactory.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 19..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

struct PiecesFactory {
    static func makePieces(with countDictionary: [Drink: Count]) -> [Piece] {
        var pieces = [Piece]()
        for dictionary in countDictionary {
            pieces.append(Piece(category: dictionary.key.typeOfProduct, value: CGFloat(dictionary.value)))
        }
        return pieces
    }
}
