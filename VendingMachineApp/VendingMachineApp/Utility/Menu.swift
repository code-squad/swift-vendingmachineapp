//
//  MenuType.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol Discriptable: RawRepresentable {
    static var description: String { get }
}

enum Mode: String, Discriptable {
    static var description = "1. 관리자 모드\n2. 사용자 모드\n> "
    
    case manager = "1"
    case user = "2"
}

enum UserMenu: String, Discriptable {
    static var description = "\n1. 금액추가\n2. 음료구매\n3. 히스토리\n4. 종료\n> "
    
    case deposit = "1"
    case purchase = "2"
    case history = "3"
    case exit = "4"
}

enum ManagerMenu: String, Discriptable {
    static var description = "1. 재고 추가\n2. 폐기\n3. 종료\n> "
    case add = "1"
    case remove = "2"
    case exit = "3"
}
