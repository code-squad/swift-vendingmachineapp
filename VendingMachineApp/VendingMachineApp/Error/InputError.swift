//
//  InputError.swift
//  VendingMachine
//
//  Created by 이동건 on 25/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum InputError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .wrongInput:
            return "❌ 올바른 값을 입력해주세요. ❌"
        case .noInput:
            return "✏️ 입력값이 존재하지 않습니다. ✏️"
        }
    }
    case wrongInput
    case noInput
}
