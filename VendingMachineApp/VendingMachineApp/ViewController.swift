//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let machine = Machine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         자판기에 초기 종자돈 100_000원 투입
         음료수 네 종류를 재고로 추가 (같은 종류의 음료수를 두 차례 걸쳐서 추가)
         사용자가 만원을 투입
         유통기한이 지난 재고만 리턴
         투입 금액으로 살 수 있는 음료수 재고 리턴
         사용자가 잘못된 구매 버튼을 클릭
         사용자가 구매 버튼을 클릭
         해당 음료수 구매 완료
         투입 금액의 잔액을 확인한다.
         자판기 음료수의 재고를 확인한다.
         투입 금액의 잔액으로 살 수 있는 음료수 재고를 리턴한다.
         잔액으로 음료수 하나를 더 산다
         거래 중단
        */
        
        machine.increaseCashInMoneyStorage(by: 100_000)
        
        let lowFatMilk = Milk(brand: "서울우유", size: 1000, price: 1500, name: "저지방우유", packDate: Date(), farm: DomesticLocation(province: "경상북도"))
        
        machine.addStock(beverage: someMilk, count: 10)
        machine.receiveMoney(amount: 10_000)
        machine.showExpired()
        machine.showPurchasables()
        machine.purchaseBeverage(index: 4)
        machine.purchaseBeverage(index: 2)
        machine.showInsertedCashBalance()
        machine.checkStock()
        machine.showPurchasables()
        machine.purchaseBeverage(index: 2)
        machine.showInsertedCashBalance()
        machine.checkStock()
        machine.showPurchasables()
        machine.transactionStopButtonPressed()
        machine.showMoneyStorageDeposit()
        print("거래 끝")
    }
    
    func generateDate(year newYear: Int, month newMonth: Int, day newDay: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = newYear
        dateComponents.month = newMonth
        dateComponents.day = newDay
        dateComponents.timeZone = TimeZone(abbreviation: "JST")
        
        let userCalendar = Calendar(identifier: .gregorian)
        guard let someDateTime = userCalendar.date(from: dateComponents) else { return Date(timeIntervalSinceReferenceDate: -123456789.0)}
        
        return someDateTime
    }
}

