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
    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var chargeButtons: [UIButton]!
    
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    private let chargeAmount = [1000, 5000]
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var buttonsForDrink: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrinkImage()
        updateDrinkStockLabels()
        updateRemainCoinsLabel()
        setButtonsForCharge()
        setButtonsForDrink()
    }
    
    func setButtonsForDrink() {
        addButtons.forEach {
            $0.addTarget(self, action: #selector(addDrinkStock), for: .touchUpInside)
        }
        
        addButtons.enumerated().forEach {
            buttonsForDrink[$1] = drinkType[$0]
        }
    }
    
    func setButtonsForCharge() {
        chargeButtons.forEach {
            $0.addTarget(self, action: #selector(charge), for: .touchUpInside)
        }
        
        chargeButtons.enumerated().forEach {
            buttonsForCharge[$1] = chargeAmount[$0]
        }
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 10
        }
    }
    
    func updateDrinkStockLabels() {
        guard let allDrinks = appDelegate.vendingMachine?.getAllDrinks() else {
            return
        }
        drinkType.enumerated().forEach { index, type in
            let id = ObjectIdentifier(type)
            drinkStockLabels[index].text = "\(allDrinks[id]?.count ?? 0)개"
        }
    }
    
    func updateRemainCoinsLabel() {
        guard let remainCoins = appDelegate.vendingMachine?.checkRemainCoins() else {
            return
        }
        remainCoinsLabel.text = "\(remainCoins)원"
    }
    
    // MARK: IBActions
    @objc func addDrinkStock(_ sender: UIButton) {
        guard let type = buttonsForDrink[sender], let drink = DrinkFactory.createDrink(for: type) else {
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

