//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import UIKit

class MainHomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drinkList: [Drink] = [ Milk.init(isMilkFlavor: .Strawberry, farmCode: "001", brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          manufacturedAt: Date(), isHot: false),
                                
                                Milk.init(isMilkFlavor: .Strawberry, farmCode: "002", brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          manufacturedAt: Date(), isHot: false),
                                Soda.init(isSodaType: .Cola,
                                          factoryCode:"01",
                                          brand: "팹시",
                                          capacity: 350,
                                          price: 2000,
                                          name: "다이어트콜라",
                                          manufacturedAt: Date(), isHot: false),
                                Coffee.init(isDecaffeinated: 30, isHot: true, isCoffeeBrandName: .Cantata, brand: "맥심", capacity: 4000, price: 3000, name: "TOP아메리카노", manufacturedAt: Date())]
        let drinks = Drinks()
        for item in drinkList {
            drinks.addDrink(what: item)
        }
        let payment = Payment(myMoney: 1000)
        let vendingMachine = VendingMachine(drinks: drinks, payment: payment)
        vendingMachine.showVendingMachine(handler: { drink in
            print(drink.description)
        })
    }
}

