//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beverageFactroy : BeverageCreater = BeverageCreater()
        let seoulMilk : Beverage = beverageFactroy.makeBeverage(Milk.init(kcal: 255, taste: .strawberry, brand: "서울우유", volume: 236, price: 1600, name: "딸기는 원래 빨갛다", manufactured: Date().stringTodate("20200101")))
        let starbucks : Beverage = Coffee.init(caffeineContent: 79, caffeine: false, taste: .latte, brand: "맥심", price: 900, name: "카누", manufactured: Date().stringTodate("20200302"))
        let Monster : Beverage = beverageFactroy.makeBeverage(Energydrink.init(kcal: 70, flavor: .monster, brand: "HOT6", volume: 355, price: 2100, name: "몬스터", manufactured: Date().stringTodate("20200301")))
        let sevenStarCider : Beverage = beverageFactroy.makeBeverage(Soda.init(kcal: 255, flavor: .lemon, brand: "코카콜라컴퍼니", volume: 255, price: 1700, name: "칠성사이다", manufactured: Date().stringTodate("20200303")))
        
        let beverges : [Beverage] = [seoulMilk, starbucks, Monster, sevenStarCider]
        beverges.forEach{
            print($0.description)
       }
        
    }
}

