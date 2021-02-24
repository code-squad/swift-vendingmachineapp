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
        machine.showBalance()
        machine.increaseCashInMoneyStorage(by: 1000)
        machine.showBalance()
    
        let someSoda = Soda(brandName: "코카콜라", sizeInMilliliter: 500, itemPrice: 1000, itemName: "코카콜라", manufacturingDate: generateDate(year: 1999, month: 04, day: 32))
        let someMilk = Soda(brandName: "서울우유", sizeInMilliliter: 250, itemPrice: 3000, itemName: "딸기맛우유", manufacturingDate: generateDate(year: 2020, month: 02, day: 01))
        let someAmericano = Americano(brandName: "스타벅스", sizeInMilliliter: 450, itemPrice: 4500, itemName: "콜드브루", manufacturingDate: Date(), coffeeBean: .로부스타원두, caffeine: 400)
        
        machine.addStock(beverage: someSoda, count: 2)
        machine.addStock(beverage: someMilk, count: 5)
        machine.addStock(beverage: someAmericano, count: 10)
        
        machine.purchaseBeverage(insert: 2000, index: 1)
        machine.transactionStopButtonPressed()
        machine.showExpired()
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

