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
    
    var drinks: [Drink: Int] = [:]
    var vendingMachine: VendingMachine? {
        didSet {
            if var vm = vendingMachine {
                drinks = vm.getAllDrinks()
            }
        }
    }

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
    
    @IBAction func addStock(_ sender: UIButton) {
        let tag = sender.tag
        guard var vm = vendingMachine, let drink = DrinkFactory.createDrink(tag: tag) else {
            return
        }
        vm.addStock(for: drink)
        
        let drinks = vm.getAllDrinks()
        if let stock = drinks[drink] {
            drinkStockLabels[tag - 1].text = "\(String(stock))개"
        }
    }
    
    @IBAction func charge(_ sender: UIButton) {
        let tag = sender.tag
        vendingMachine?.charge(coins: tag)
        if let coins = vendingMachine?.checkRemainCoins() {
            remainCoinsLabel.text = String(coins)
        }
    }
}

