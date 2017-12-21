//
//  PiecesFactory.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 19..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

struct PiecesFactory {
    var colors: [UIColor] {
        return [.red, .yellow, .brown, .black, .blue, .cyan, .gray, .orange, .purple, .green]
    }
    func makePieces() -> [Piece] {
        let countDictionary = VendingMachine.sharedInstance.countOfPhurchases()
        var pieces = [Piece]()
        for dictionary in countDictionary {
            pieces.append(
                Piece(
                    category : dictionary.key.typeOfProduct,
                    color    : colors[pieces.count],
                    value    : CGFloat(dictionary.value)
                )
            )
        }
        return pieces
    }
    func changeColorOfPieces(with pieces: [Piece]) -> [Piece] {
        let randomIndex = makeRandomIndex()
        var newPieces = pieces
        for i in 0..<pieces.count {
            newPieces[i].color = colors[randomIndex[i]]
        }
        return newPieces
    }

    func makeRandomIndex() -> [Int] {
        var indexes = Set<Int>()
        let maxNumber = colors.count
        while indexes.count != maxNumber {
            indexes.insert(Int(arc4random_uniform(UInt32(maxNumber))))
        }
        return Array(indexes)
    }
}
