//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drinkImages: [UIImageView]!
    
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
        print(vm.getAllDrinks().keys, vm.getAllDrinks().values)
    }
}

