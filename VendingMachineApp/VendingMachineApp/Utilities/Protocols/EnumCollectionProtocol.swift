//
//  EnumCollectionProtocol.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

// EnumCollection을 채택한 타입은 Hashable도 구현해야 함. Enum은 이미 Hashable이므로 hashValue를 따로 구현해줄 필요 없음.
protocol EnumCollection: Hashable {
    // sequence를 array로 타입캐스팅하여 반환.
    static var allValues: [Self] { get }
    static func getCase(rawValue: Int) -> VendingMachine.Menu?
}
