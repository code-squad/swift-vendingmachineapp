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
        
        let coffee : Beverage = Beverage.init(brand: "스타벅스", volume: 255, price: 4100, name: "아메리카노", manufactured: Date().returnStringDate("20210101"))
        let milk : Beverage = Beverage.init(brand: "매일우유", volume: 180, price: 1300, name: "흰 우유", manufactured: Date().returnStringDate("20210102"))
        let soda : Beverage = Beverage.init(brand: "롯데칠성음료", volume: 330, price: 2500, name: "트레비", manufactured: Date().returnStringDate("20210103"))
        let beverages : [CustomStringConvertible] = [coffee, milk, soda]
        let vm = VendingMachine()
        vm.printBeverages(beverages)
    }
}

