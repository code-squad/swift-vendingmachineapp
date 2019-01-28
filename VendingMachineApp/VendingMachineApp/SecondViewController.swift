//
//  ManagerModeViewController.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 28/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var drinkLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(updateDrinkLabel), name: .stockChanged, object: nil)
        initialAddButtonTag()
        initialLabel()
    }
    
    @objc func updateDrinkLabel() {
        let commonMode: CommonAvailableMachine = VendingMachine.sharedInstance
        for menu in DrinkCategory.allCases {
            commonMode.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu.rawValue-1].text = "\(drinkCounts)개"
            }
        }
    }
    
    private func initialAddButtonTag() {
        var tag = 1
        for button in addButtons {
            button.tag = tag
            tag += 1
        }
    }
    
    private func initialLabel() {
        let machine: CommonAvailableMachine = VendingMachine.sharedInstance
        for menu in DrinkCategory.allCases {
            machine.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu.rawValue-1].text = "\(drinkCounts)개"
            }
        }
    }
    
    @IBAction func addStocks(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let menu = DrinkCategory(rawValue: button.tag) else { return }
        addEachDrink(of: menu)
    }
    
    private func addEachDrink(of menu: DrinkCategory) {
        let managerMode: ManageableMode = VendingMachine.sharedInstance
        managerMode.addStock(menu: menu)
    }
    
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
