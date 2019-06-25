//
//  Ment.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/24/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Ment: String {
    case nonIndex = "없는 인덱스입니다."
    case supplyAmountGuide = "추가할 숫자를 입력해주세요. (최대 100)"
    case unableNumber = "숫자를 잘못 입력하셨습니다."
    case unableDrinkIndex = "해당 번호에 해당하는 음료는 없습니다. 번호를 확인해주세요."
    case vendingMachineStart = "자판기를 시작합니다.\n1. 관리자 모드\n2. 사용자 모드"
    case insertCoinGuidance = "넣을 금액을 입력해주세요."
    case menuInputGuidance = "\n1. 금액추가\n2. 음료구매\n0. 종료\n> "
}
