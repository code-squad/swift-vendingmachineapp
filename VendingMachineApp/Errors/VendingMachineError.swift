//
//  VendingMachineError.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ErrorType{
    static let systemError: String = "[ 시스템 에러 ]"
    static let userError: String = "[ 사용자 에러 ]"
}


enum VendingMachineError: Error, CustomStringConvertible{
    case addDrinkToUnknownMenuNumberError
    case notFoundDrinkIdError
    case invalidMenuSelectNumberError
    case invalidAdminMenuSelectNumberError
    case inputTypeCastingError
    case notEnoughMoneyError
    case outOfStockError
    case unknownError
    case invalidChargeMoney
    case invalidInputNumbers
    case invalidBeverageInfo
    case invalidRangeNumberError
    case invalidDrinkQuantity
    var description: String {
        switch self {
        case .addDrinkToUnknownMenuNumberError:
            return "\(ErrorType.systemError) \n선택한 음료수를 넣을 매팽주소가 잘못 지정되었습니다."
        case .notFoundDrinkIdError:
            return "\(ErrorType.userError) \n음료수 메뉴선택이 잘못되었습니다."
        case .invalidMenuSelectNumberError:
            return "\(ErrorType.userError) \n금액추가 또는 음료구매 선택은 각각 1,2 로 해주십시오"
        case .invalidAdminMenuSelectNumberError:
            return "\(ErrorType.userError) \n재고보충 또는 재고 비우기 선택은 각각 1,2 로 해주십시오"
        case .invalidRangeNumberError:
            return "\(ErrorType.userError) \n입력값을 유효한 양의 정수로 해주세요"
        case .inputTypeCastingError, .invalidInputNumbers:
            return "\(ErrorType.userError) \n양의 숫자쌍(ex: 1 10000)으로 입력해주세요"
        case .notEnoughMoneyError:
            return "\(ErrorType.systemError) \n투입잔고가 음료수를 사기에 부족합니다.\n금액을 더 넣어주세요"
        case .outOfStockError:
            return "\(ErrorType.systemError) \n재고가 부족합니다. 다른 메뉴를 선택해주세요"
        case .unknownError:
            return "\(ErrorType.systemError) \n알 수 없는 에러!!"
        case .invalidChargeMoney:
            return "\(ErrorType.userError) \n충전 금액은 양수여야 합니다."
        case .invalidBeverageInfo:
            return "\(ErrorType.systemError) \n선택한 음료수 가격 정보가 불명확합니다."
        case .invalidDrinkQuantity:
            return "\(ErrorType.systemError) \n음료수 수량 정보가 없습니다.!!"
        }
    }
}
