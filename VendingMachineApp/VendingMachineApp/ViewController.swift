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
    var machine: VendingMachine = VendingMachine()

    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet var drinkLabels: [UILabel]!
    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var insertButtons: [UIButton]!
    @IBOutlet weak var currentCoin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentCoin.text = "잔액 : " + machine.currentCoinState() + "원"
        initialImage()
        initialLabel()
        initialAddButtonTag()
        initialInserButtonTag()
    }
    
    private func initialImage() {
        for image in drinkImages { image.setCornerRadius() }
    }
    
    private func initialLabel() {
        let machine: AvailableCommonMachineFunction = self.machine
        var eachMenuNumber = 1
        for label in drinkLabels {
            label.text = "\(machine.getEachStockCount(menu: eachMenuNumber))개"
            eachMenuNumber += 1
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
        let managerMode: ManageableMode = machine
        if managerMode.isAbleToAdd(menu: menu) == .success {
            machine.addStock(menu: menu)
            drinkLabels[menu-1].text = "\(machine.getEachStockCount(menu: menu))개"
        }
    }
    
    @IBAction func insertCoin(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 1: setInserState(coin: 1000)
        case 2: setInserState(coin: 5000)
        default: return
        }
    }
    private func setInserState(coin: Int) {
        let userMode: UserAvailableMode = machine
        userMode.insert(coin: coin)
        currentCoin.text = "잔액 : " + machine.currentCoinState() + "원"
    }
}




