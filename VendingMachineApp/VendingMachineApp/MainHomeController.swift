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
        
        let drinks: [Drink] = [ Milk.init(brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          madeDate: Date()),
                                
                                Milk.init(brand: "서울우유",
                                          capacity: 200,
                                          price: 1000,
                                          name: "날마다딸기우유",
                                          madeDate: Date()),
                                Soda.init(brand: "팹시",
                                          capacity: 350,
                                          price: 2000,
                                          name: "다이어트콜라",
                                          madeDate: Date()),
                                Coffee.init(brand: "맥심",
                                            capacity: 4000,
                                            price: 3000,
                                            name: "TOP아메리카노",
                                            madeDate: Date())]
        
        let vendingMachine = VendingMachine(drinks: drinks)
        vendingMachine.showVendingMachine(handler: { drink in
            print(drink.description)
        })
    }
}

