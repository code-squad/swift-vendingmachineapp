//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/20.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var drinkList: UIStackView!
    
    var vm: AdminMode?
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var addButtonsForDrink: [UIButton: Drink.Type] = [:] // TODO: 하위 타입으로
    private var drinkViews: [DrinkStackView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drinkType.forEach {
            let drinkStackView = makeDrinkStackView(for: $0)
            drinkStackView.addArrangedSubview(makeAddButton(for: $0))
            drinkList.addArrangedSubview(drinkStackView)
            drinkViews.append(drinkStackView)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabel), name: VendingMachine.NotificationName.updatedDrinkStock, object: nil)
        
        guard let vm = vm as? VendingMachine else {
            return
        }
        vm.post()
    }
    
    func makeDrinkStackView(for drink: Drink.Type) -> DrinkStackView {
        let drinkView = DrinkStackView()
        drinkView.configure(for: drink)
        return drinkView
    }
    
    func makeAddButton(for drink: Drink.Type) -> UIButton {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.link, for: .normal)
        addButtonsForDrink[button] = drink
        button.addTarget(self, action: #selector(addStock), for: .touchUpInside)
        return button
    }

    @objc func addStock(_ sender: UIButton) {
        guard let drinkType = addButtonsForDrink[sender],
              let drink = DrinkFactory.createDrink(for: drinkType) else {
            return
        }
        VendingMachine.shared.add(for: drink)
    }
    
    @objc func updateStockLabel(notification: Notification) {
        drinkViews.forEach {
            $0.updateStockLabel(notification: notification)
        }
    }
    
    @IBAction func dismiss() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
