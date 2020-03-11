//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let primiumLatte = Cantata(volume: 275, price: 2200,
                                   name: "프리미엄 라떼",
                                   manufacturingDateInfo: "20200102",
                                   celsius: 65)
        let dietCola = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라",
                             manufacturingDateInfo: "20190928", kiloCalorie: 80)
        let cookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                    name: "쿠키앤크림",
                                                    manufacturingDateInfo: "20191116",
                                                    expirationDateInfo: "20191123")
        
        let nonInitMessage = "non-init"
        print(primiumLatte?.description ?? nonInitMessage)
        print(dietCola?.description ?? nonInitMessage)
        print(cookieCreamMilk?.description ?? nonInitMessage)
    }

}
