//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

enum DrinkTags: Int {
    case blueBottleColdBrewBold
    case fantaOrange
    case bananaMilk
    case seoulStrawberryMilk
    case sanpellegrino
    case starbucksColdBrewBlack
}

class ViewController: UIViewController, SelectPanelStackViewDelegate {
    @IBOutlet weak var selectPanelStackView: SelectPanelStackView!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine()
        selectPanelStackView.delegate = self
    }
    
    func didAddDrink(typeOf drinkType: Drink.Type) {
        vendingMachine.addDrink(drinkType)
        loadSelectPanelStackViewLabels()
    }
}

extension ViewController {
    private func findDrinkTypeToTag(of tag: Int) -> Drink.Type? {
        switch tag {
        case 0: return BlueBottleColdBrew.self
        case 1: return Fanta.self
        case 2: return BingBananaMilk.self
        case 3: return SeoulStrawberryMilk.self
        case 4: return Sanpellegrino.self
        case 5: return StarbucksColdBrew.self
        default: return nil
        }
    }
    
    private func loadSelectPanelStackViewLabels() {
        let stock = vendingMachine.showStock()
        selectPanelStackView.stockDrinkLabels.enumerated().forEach { (index, label) in
            guard let type = findDrinkTypeToTag(of: label.tag) else { return }
            let typeKey = ObjectIdentifier(type)
            if stock[typeKey] != nil {
                label.text = "\(stock[typeKey]!.count)개"
            } else {
                label.text = "0개"
            }
        }
    }
}
