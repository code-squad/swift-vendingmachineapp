//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private var vendingMachine = VendingMachine(stock: [Cantata(cantataBuilder:
                                                                Cantatas.builderPrimiumLatte175ml,
                                                                manufacturingDateInfo: "20200102",
                                                                celsius: 65)!,
                                                        Cantata(cantataBuilder:
                                                                Cantatas.builderPrimiumLatte275ml,
                                                                manufacturingDateInfo: "20200102",
                                                                celsius: 65)!,
                                                        Pepsi(pepsiBuilder:
                                                              Pepsis.builderDietCola250ml,
                                                              manufacturingDateInfo: "20190928")!,
                                                        Pepsi(pepsiBuilder:
                                                              Pepsis.builderDietCola591ml,
                                                              manufacturingDateInfo: "20190928")!,
                                                        HersheyChocolateDrink(hersheyBuilder:
                                                                              HersheyChocolateDrinks
                                                                              .builderCookieCream235ml,
                                                                              manufacturingDateInfo: "20191116",
                                                                              expirationDateInfo: "20191123")!,
                                                        HersheyChocolateDrink(hersheyBuilder:
                                                                              HersheyChocolateDrinks
                                                                              .builderCookieCream350ml,
                                                                              manufacturingDateInfo: "20191116",
                                                                              expirationDateInfo: "20191123")!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
