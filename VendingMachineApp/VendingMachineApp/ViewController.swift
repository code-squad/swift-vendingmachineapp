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
            for i in 0..<drinks.count {
                buttonsForDrink[addButtons[i]] = drinks[i]
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
    private let userDefault = UserDefaults.standard
    private let chargeAmount = [1000, 5000]
    private let drinks = [BananaMilk.self, Cantata.self, Fanta.self]
    private lazy var vendingMachine: VendingMachine? = appDelegate.vendingMachine
    private var buttonsForDrink: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrinkImage()
        setupVendingMachine()
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 10
        }
    }
    
    func setupVendingMachine() {
        let drinks = Drinks()
        vendingMachine = VendingMachine(drinks: drinks)
    }
    
    // MARK: IBActions
    @IBAction func addStockButton(_ sender: UIButton) {
        guard var vm = vendingMachine, let type = buttonsForDrink[sender],
              let drink = DrinkFactory.createDrink(for: type) else {
            return
        }
        
        vm.addStock(for: drink)
        let drinks = vm.getAllDrinks()
        if let stock = drinks[drink], let index = addButtons.firstIndex(of: sender) {
            drinkStockLabels[index].text = "\(String(stock))개"
        }
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

