//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var drinks: [Drink] = []
        drinks.append(Milk(manufacturer: "사울우유", volume: 200, name: "날마다딸기우유", dateOfManufacture: Date(), price: 1000, flavor: .straberry))
        drinks.append(Milk(manufacturer: "사울우유", volume: 200, name: "날마다딸기우유", dateOfManufacture: Date(), price: 1000, flavor: .straberry))
        drinks.append(Soda(manufacturer: "펩시", volume: 350, name: "다이어트콜라", dateOfManufacture: Date(), price: 2000, kind: .coke))
        drinks.append(Coffee(manufacturer: "맥심", volume: 400, name: "아메리카노", dateOfManufacture: Date(), price: 3000, brand: .top))
                
        let vm = VendingMachine(drinks: Drinks(drinks: drinks))
        vm.retrieveDrinks(completion: { drink in
            print(drink)
        })
    }
}

