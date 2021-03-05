//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet weak var remainCoinsLabel: UILabel!
    @IBOutlet var drinkStockLabels: [UILabel]!
    @IBOutlet var addButtons: [UIButton]! {
        didSet {
            var i = 0
            let drinks = [BananaMilk.self, Cantata.self, Fanta.self]
            addButtons.forEach { button in
                buttonsForDrink[button] = drinks[i]
                i += 1
            }
        }
    }
    
    var vendingMachine: VendingMachine?
    var buttonsForDrink: [UIButton: Drink.Type] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrinkImage()
        setupVendingMachine()
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 10
        }
    }
    
    func setupVendingMachine() {
        let drinks = Drinks()
        vendingMachine = VendingMachine(drinks: drinks)
    }
    
    // MARK: IBActions
    @IBAction func addDrinkStock(_ sender: UIButton) {
        guard var vm = vendingMachine, let type = buttonsForDrink[sender] else {
            return
        }
        if let drink = DrinkFactory.createDrink(for: type) {
            vm.addStock(for: drink)
        }
    }
    
    @IBAction func charge(_ sender: UIButton) {
        let tag = sender.tag
        vendingMachine?.charge(coins: tag)
        if let coins = vendingMachine?.checkRemainCoins() {
            remainCoinsLabel.text = "\(String(coins))원"
        }
    }
}

