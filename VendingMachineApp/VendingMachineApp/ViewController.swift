//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let primiumLatte = Cantata(volume: 275, price: 2200, name: "프리미엄 라떼", dateInfo: "20200102")
        let dietCola = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라", dateInfo: "20190928")
        let cookieCream = HersheyChocolateDrink(volume: 190, price: 1500, name: "쿠키 앤 크림", dateInfo: "20191116")
        
        let nonInitMessage = "non-init"
        print(primiumLatte?.description ?? nonInitMessage)
        print(dietCola?.description ?? nonInitMessage)
        print(cookieCream?.description ?? nonInitMessage)
    }
    
}

