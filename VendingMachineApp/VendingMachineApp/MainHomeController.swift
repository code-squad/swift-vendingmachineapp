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
        
        let drinks: [Drink] = [ Milk.init(isMilkFlavor: .Strawberry, farmCode: "001", brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          madeDate: Date(), isHot: false, beverageType: BeverageType.Milk),
                                
                                Milk.init(isMilkFlavor: .Strawberry, farmCode: "002", brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          madeDate: Date(), isHot: false, beverageType: BeverageType.Milk),
                                Soda.init(isSodaType: .Cola,
                                          factoryCode:"01",
                                          brand: "팹시",
                                          capacity: 350,
                                          price: 2000,
                                          name: "다이어트콜라",
                                          madeDate: Date(), isHot: false, beverageType: BeverageType.Soda),
                                Coffee.init(isDecaffeinated: true, isHot: true, isCoffeeBrandName: .Cantata, brand: "맥심", capacity: 4000, price: 3000, name: "TOP아메리카노", madeDate: Date(), beverageType: BeverageType.Soda)]
        
        let vendingMachine = VendingMachine(drinks: drinks)
        vendingMachine.showVendingMachine(handler: { drink in
            print(drink.description)
        })
        
        let tmpMilk = Milk.init(isMilkFlavor: .Strawberry, farmCode: "001", brand: "서울우유",
                                capacity: 200,
                                price: 1000,
                                name: "날마다딸기우유",
                                madeDate: Date(), isHot: false, beverageType: BeverageType.Milk)
        
        let tmpString = tmpMilk.isBeverageType()
        let tmpString2 = Coffee.init(isDecaffeinated: true, isHot: true, isCoffeeBrandName: .Cantata, brand: "맥심", capacity: 4000, price: 3000, name: "TOP아메리카노", madeDate: Date(), beverageType: BeverageType.Soda)
        print("=========")
        print(tmpString)
        print(tmpString2.isBeverageType())
    }
}

