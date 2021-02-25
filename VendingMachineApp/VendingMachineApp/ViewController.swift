//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let seoulStrawberryMilk1 = Milk(brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", manufactured: "20171009", type: .strawberry)
        let seoulStrawberryMilk2 = Milk(brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", manufactured: "20171012", type: .strawberry)
        let pepsiDietCola = SoftDrink(brand: "팹시", volume: 350, price: 2000, name: "다이어트콜라", manufactured: "20171005", type: .cola)
        let topAmericano = Coffee(brand: "맥심", volume: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010", type: .top)
        
        let vendingMachine = VendingMachine(inventory: [seoulStrawberryMilk1, seoulStrawberryMilk2, pepsiDietCola, topAmericano])
        OutputView.printInventory(of: vendingMachine)
    }
}
