//
//  Color.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 21..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

struct Color {
    var original: [UIColor] {
        return [.red, .yellow, .brown, .black, .blue, .cyan, .gray, .orange, .purple, .green]
    }

    func makeRandomColor() -> [UIColor] {
        let indexes = makeRandomIndex()
        var randomColors = [UIColor]()
        indexes.forEach { randomColors.append(original[$0])}
        return randomColors
    }

    private func makeRandomIndex() -> [Int] {
        var indexes = Set<Int>()
        let maxNumber = original.count
        while indexes.count != maxNumber {
            indexes.insert(Int(arc4random_uniform(UInt32(maxNumber))))
        }
        return Array(indexes)
    }
}
