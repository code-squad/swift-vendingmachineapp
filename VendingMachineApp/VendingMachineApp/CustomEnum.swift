//
//  CustomEnum.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
import UIKit

// 에러 케이스 enum
enum Exception: Error {
    case notEnoughBalance
    case outOfStock

    var description: ProgramDescription {
        switch self {
        case .notEnoughBalance:
            return ProgramDescription.notEnoughBalance
        case .outOfStock:
            return ProgramDescription.outOfStock
        }
    }
}

enum ProgramMode {
    case admin
    case user
    case none
    case quit
}

enum AdminMenu {
    case addItem
    case deleteItem
    case none
    case quit
}

enum UserMenu {
    case addBalance
    case buyItem
    case none
    case quit
}

// 음료수의 용기 패키지 타입 enum 선언
enum Package {
    case can
    case bottle
    case pet
    case carton
}

enum ValidMoney {
    case thousand
    case fiveThousand
    case zero

    var cash: Int {
        switch self {
        case .thousand: return 1000
        case .fiveThousand: return 5000
        case .zero: return 0
        }
    }
}


// 파이그래프에 사용되는 enum 선언

enum DrawType {
    case defaultGraph
    case blackCircle
    case redrawGraph
}

enum PieColors {
    case red
    case green
    case blue
    case purple

    static let allValues = [red, green, blue, purple]

    var colorList: [UIColor] {
        switch self {
        case .red:
            return self.makeList(themeColor: UIColor.red)
        case .green:
            return self.makeList(themeColor: UIColor.green)
        case .blue:
            return self.makeList(themeColor: UIColor.blue)
        case .purple:
            return self.makeList(themeColor: UIColor.purple)
        }
    }

    func makeList(themeColor: UIColor) -> [UIColor] {
        var colors: [UIColor] = []
        for i in 0..<6 {
            colors.append(themeColor.withAlphaComponent(1.0 - (0.15 * CGFloat(i))))
        }
        return colors
    }
}

