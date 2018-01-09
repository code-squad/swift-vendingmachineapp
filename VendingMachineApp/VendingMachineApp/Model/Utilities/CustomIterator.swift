//
//  Iterator.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class ClassIteratorOf<Type>: IteratorProtocol {
    typealias Element = Type
    private let elements: [Element]
    private var nextIndex: Int
    init(_ elements: [Element]) {
        nextIndex = 0
        self.elements = elements
    }

    func next() -> Element? {
        defer { nextIndex += 1 }
        guard nextIndex < elements.count else { return nil }
        return elements[nextIndex]
    }

}
