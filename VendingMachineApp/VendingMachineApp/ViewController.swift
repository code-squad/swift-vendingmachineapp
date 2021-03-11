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
            for i in 0..<drinkType.count {
                buttonsForDrink[addButtons[i]] = drinkType[i]
            }
        }
    }
    
    @IBOutlet var chargeButtons: [UIButton]! {
        didSet {
            for i in 0..<chargeAmount.count {
                buttonsForCharge[chargeButtons[i]] = chargeAmount[i]
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

