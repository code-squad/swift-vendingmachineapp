//
//  OutputView.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /// 문자열을 받아서 출력한다
    func printMessage(message:String){
        print (message)
    }
    
    /// 에러 출력 메세지들
    enum errorMessage : Error, CustomStringConvertible {
        case wrongMoney
        case wrongMenu
        case quitMessage
        case notEnoughDrink
        case notNumeric
        case notEnoughMoney
        case wrongDrink
        case noDrinks
        case toModeSelect
        case failMakingVendingMachine
        
        var description: String {
            switch self {
            case .wrongMoney : return "잘못된 금액입니다."
            case .wrongMenu : return "잘못된 메뉴입니다."
            case .quitMessage : return "자판기를 종료합니다."
            case .notEnoughDrink : return "음료 재고가 부족합니다."
            case .notNumeric : return "잘못된 수 입니다."
            case .notEnoughMoney : return "입력된 금액이 부족합니다."
            case .wrongDrink : return "잘못된 음료입니다."
            case .noDrinks : return "판매가능한 음료가 없습니다. \(errorMessage.quitMessage.description)"
            case .toModeSelect : return "모드선택으로 이동합니다."
            case .failMakingVendingMachine : return "자판기 초기적재에 실패하였습니다. \(errorMessage.quitMessage.description)"
            }
        }
    }
    
    /// 시작 화면
    func welcomMessage()->String{
        return("자판기 프로그램을 시작합니다..")
    }
    /// 자판기 금액을 리턴한다
    func returnMoney(money:Int)->String{
        return("현재 자판기에 입력된 금액은 \(money)원 입니다.")
    }
    
    /// 음료수 구매성공 메세지
    func buyingSuccessMessage(drinkName:String,drinkCount:Int,drinkPrice:Int)->String{
        return("\(drinkName) \(drinkCount)개를 \(drinkPrice)원에 구매하였습니다.")
    }
    /// 재고정보를 받아서 구매성공메세지를 리턴하는 같은 함수
    func buyingSuccessMessage(drinkDetail:StoredDrinkDetail)->String{
        return("\(drinkDetail.drinkName) \(drinkDetail.drinkCount)개를 \(drinkDetail.drinkCount * drinkDetail.drinkPrice)원에 구매하였습니다.")
    }
    
    /// 재고정보를 받아서 구매 결과를 표시. 성공 or 실패
    func buyingResult(drinkDetail:StoredDrinkDetail?) throws ->String{
        // 구매 성공시
        if let result = drinkDetail {
            return buyingSuccessMessage(drinkDetail: result)
        } // 구매실패시
        else {
            throw OutputView.errorMessage.notEnoughDrink
        }
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    func userFirstMenu()->String{
        var result = ""
        result += ("1. 돈 추가투입\n")
        result += ("2. 음료 선택\n")
        result += ("q. 모드 선택\n")
        return result
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    func adminFirstMenu()->String{
        var result = ""
        result += ("1. 음료 추가\n")
        result += ("2. 음료 제거\n")
        result += ("q. 모드 선택\n")
        return result
    }
    
    /// 모드선택 메뉴
    func modeSelectMenu()->String{
        var result = ""
        result += ("1. 관리자 모드 진입\n")
        result += ("2. 사용자 모드 진입\n")
        result += ("q. 자판기 종료\n")
        return result
    }
    
    /// 프로그램 시작시 나오는 메인메뉴 출력문
    func mainMenu(vendingMachine:VendingMachine)throws->String{
        // 리턴용 함수
        var result = ""
        result += try getAllDrinkList(vendingMachine: vendingMachine)+"\n"
        result += modeSelectMenu()        
        return result
    }
    
    /// 구매가능한 음료수 리스트 출력
    func getAllDrinkList(vendingMachine:VendingMachine)throws->String{
        // 리턴용 함수
        var result = ""
        // 구입가능 음료 리스트
        let inventoryDetail = vendingMachine.getAllAvailableDrinks()
        guard inventoryDetail.storedDrinksDetail.count > 0 else {
            throw OutputView.errorMessage.noDrinks
        }
        result += inventoryDetail.getAllDrinkDetails()+"\n"
        return result
    }
    /// 프로그램 시작시 나오는 메인메뉴 출력문
    func userMenu(vendingMachine:VendingMachine)throws->String{
        // 리턴용 함수
        var result = ""
        // 시작 메세지. 소지금, 구입가능 음료 리스트, 메뉴 출력
        result += returnMoney(money: vendingMachine.getMoney())+"\n"
        result += try getAllDrinkList(vendingMachine: vendingMachine)+"\n"
        result += userFirstMenu()
        return result
    }
    
    /// 프로그램 시작시 나오는 메인메뉴 출력문
    func adminMenu(vendingMachine:VendingMachine)throws->String{
        // 리턴용 함수
        var result = ""
        // 시작 메세지. 소지금, 구입가능 음료 리스트, 메뉴 출력
        result += returnMoney(money: vendingMachine.getMoney())+"\n"
        result += try getAllDrinkList(vendingMachine: vendingMachine)+"\n"
        result += adminFirstMenu()
        return result
    }
}
