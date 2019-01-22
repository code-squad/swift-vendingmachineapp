//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 15/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

extension UIImageView {
    func setCornerRadius() {
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
}


class ViewController: UIViewController {    
    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet var drinkLabels: [UILabel]!
    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var insertButtons: [UIButton]!
    @IBOutlet weak var currentCoin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialImage()
        initialLabel()
        initialAddButtonTag()
        initialInserButtonTag()
    }
    
    private func initialImage() {
        for image in drinkImages { image.setCornerRadius() }
    }
    
    private func initialLabel() {
        let menuCount = 6
        let machine: CommonAvailableMachine = VendingMachine.sharedInstance
        for menu in 1...menuCount {
            machine.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu-1].text = "\(drinkCounts)개"
            }
        }
        machine.markCoinLabel { coin in
            self.currentCoin.text = "잔액 : \(coin)원"
        }
    }
    
    private func initialAddButtonTag() {
        var tag = 1
        for button in addButtons {
            button.tag = tag
            tag += 1
        }
    }
    
    private func initialInserButtonTag() {
        var tag = 1
        for button in insertButtons {
            button.tag = tag
            tag += 1
        }
    }
    
    @IBAction func addStock(_ sender: Any) {
        let menu: DrinkCategory
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 1: menu = DrinkCategory.bananaMilk
        case 2: menu = DrinkCategory.chocoMilk
        case 3: menu = DrinkCategory.cola
        case 4: menu = DrinkCategory.fanta
        case 5: menu = DrinkCategory.cantata
        case 6: menu = DrinkCategory.top
        default: return
        }
        addEachDrink(of: menu.rawValue)
    }
    
    private func addEachDrink(of menu: Int) {
        let managerMode: ManageableMode = VendingMachine.sharedInstance
        if managerMode.isAbleToAdd(menu: menu) == .success {
            managerMode.addStock(menu: menu)
            managerMode.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu-1].text = "\(drinkCounts)개"
            }
        }
    }
    
    @IBAction func insertCoin(_ sender: Any) {
        enum InsertCoin: Int {
            case oneThousand = 1000
            case fiveThousand = 5000
        }
        
        let coin: InsertCoin
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 1: coin = .oneThousand
        case 2: coin = .fiveThousand
        default: return
        }
        insertEach(coin.rawValue)
    }
    
    private func insertEach(_ coin: Int) {
        let userMode: UserAvailableMode = VendingMachine.sharedInstance
        userMode.insert(coin: coin)
        userMode.markCoinLabel { coin in
            self.currentCoin.text = "잔액 : \(coin)원"
        }
    }
}
