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
        let primiumLatte = Cantata(cantataBuilder: Cantatas.builderPrimiumLatte175ml,
                                   manufacturingDateInfo: "20200102",
                                   celsius: 65)
        let dietCola = Pepsi(pepsiBuilder: Pepsis.builderDietCola250ml,
                             manufacturingDateInfo: "20190928")
        let cookieCreamMilk = HersheyChocolateDrink(hersheyBuilder: HersheyChocolateDrinks
                                                    .builderCookieCream235ml,
                                                    manufacturingDateInfo: "20191116",
                                                    expirationDateInfo: "20191123")
        
        let nonInitMessage = "non-init"
        print(primiumLatte?.description ?? nonInitMessage)
        print(dietCola?.description ?? nonInitMessage)
        print(cookieCreamMilk?.description ?? nonInitMessage)
    }
    
}
