//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet weak var remainCoinsLabel: UILabel!
    @IBOutlet var drinkStockLabels: [UILabel]!
    @IBOutlet var addButtons: [UIButton]! {
        didSet {
            drinkType.enumerated().forEach { (index, value) in
                buttonsForDrink[addButtons[index]] = value
            }
        }
    }
    
    @IBOutlet var chargeButtons: [UIButton]! {
        didSet {
            chargeAmount.enumerated().forEach { (index, value) in
                buttonsForCharge[chargeButtons[index]] = value
            }
        }
    }
    
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var vendingMachine: VendingMachine? = appDelegate.vendingMachine
    private let chargeAmount = [1000, 5000]
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var buttonsForDrink: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrinkImage()
        updateDrinkStockLabels()
        updateRemainCoinsLabel()
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 10
        }
    }
    
    func updateDrinkStockLabels() {
        guard let vm = vendingMachine else {
            return
        }
        let allDrinks = vm.getAllDrinks()
        var stocks: [Int] = []
        drinkType.forEach { type in
            let id = ObjectIdentifier(type)
            stocks.append(allDrinks[id]?.count ?? 0)
        }
        
        for i in 0..<stocks.count {
            drinkStockLabels[i].text = "\(String(stocks[i]))개"
        }
    }
    
    func updateRemainCoinsLabel() {
        guard let vm = vendingMachine else {
            return
        }
        let remainCoins = vm.checkRemainCoins()
        remainCoinsLabel.text = "\(remainCoins)원"
    }
    
    // MARK: IBActions
    @IBAction func addStockButton(_ sender: UIButton) {
        guard let vm = vendingMachine, let type = buttonsForDrink[sender],
              let drink = DrinkFactory.createDrink(for: type) else {
            return
        }
        vm.addStock(for: drink)
        updateDrinkStockLabels()
    }
    
    @IBAction func charge(_ sender: UIButton) {
        if let chargeAmount = buttonsForCharge[sender] {
            vendingMachine?.charge(coins: chargeAmount)
        }
        if let coins = vendingMachine?.checkRemainCoins() {
            remainCoinsLabel.text = "\(String(coins))원"
        }
    }
}

