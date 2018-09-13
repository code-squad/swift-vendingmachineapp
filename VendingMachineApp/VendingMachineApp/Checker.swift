//
//  Checker.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Checker {
    
    /// 문자열을 받아서 양의 정수로 치환 가능한지 체크. 가능하면 치환, 안되면 닐 리턴
    static func checkChangePlusInt(_ text:String)->Int?{
        guard let number = Int(text),number > 0 else {
            return nil
        }
        return number
    }
    
//    /// 사용자 메뉴 체크함수. 1,2,q 이외에는 닐
//    static func checkUserFirstMenuInput(input:InputView.UserFirstMenu)throws{
//        switch input {
//        case .insertMoney,.selectDrink : return
//        case .quit : throw OutputView.errorMessage.toModeSelect
//        default : throw OutputView.errorMessage.wrongMenu
//        }
//    }
//
//    /// 관리자 메뉴 체크함수. 1,2,q 이외에는 닐
//    static func checkAdminFirstMenuInput(input:InputView.AdminFirstMenu)throws{
//        switch input {
//        case .addDrink,.removeDrink : return
//        case .quit : throw OutputView.errorMessage.toModeSelect
//        default : throw OutputView.errorMessage.wrongMenu
//        }
//    }
//
//    /// 모드선택메뉴 체크함수. 1,2,q 이외에는 닐
//    static func checkModeSelectMenuInput(input:String)->InputView.ModeSelectMenu{
//        switch input {
//        case "1" : return .admin
//        case "2" : return .user
//        case "q" : return .quit
//        default : return .none
//        }
//    }
}
