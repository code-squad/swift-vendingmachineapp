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
    @IBOutlet var addDrinkStockButtons: [UIButton]!
    @IBOutlet var chargeButtons: [UIButton]!
    @IBOutlet var purchaseButtons: [UIButton]!
    
    private let vm = VendingMachine.shared
    private let chargeAmount = ChargeUnit.allCases
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var buttonsForDrinkStock: [UIButton: Drink.Type] = [:]
    private var buttonsForPurchase: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    private var drinkX: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: VendingMachine.updatedDrinkStock, object: nil, queue: .main) { [weak self] _ in
            self?.updateDrinkStockLabels()
        }
        NotificationCenter.default.addObserver(forName: VendingMachine.updatedRemainCoins, object: nil, queue: .main) { [weak self] _ in
            self?.updateRemainCoinsLabel()
        }
        
        setupDrinkImage()
        updateDrinkStockLabels()
        updateRemainCoinsLabel()
        setButtonsForCharge()
        setButtonsForDrink()
    }
    
    func setButtonsForDrink() {
        addDrinkStockButtons.forEach {
            $0.addTarget(self, action: #selector(addDrinkStock), for: .touchUpInside)
        }
        
        addDrinkStockButtons.enumerated().forEach {
            buttonsForDrinkStock[$1] = drinkType[$0]
        }
        
        purchaseButtons.forEach {
            $0.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        }
        
        purchaseButtons.enumerated().forEach {
            buttonsForPurchase[$1] = drinkType[$0]
        }
    }
    
    func setButtonsForCharge() {
        chargeButtons.forEach {
            $0.addTarget(self, action: #selector(charge), for: .touchUpInside)
        }
        
        chargeButtons.enumerated().forEach {
            buttonsForCharge[$1] = chargeAmount[$0].rawValue
        }
    }
    
    func setupDrinkImage() {
        drinkImages.forEach { image in
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 15
        }
    }
    
    func updateDrinkStockLabels() {
        let allDrinks = vm.getAllDrinks()
        drinkType.enumerated().forEach { index, type in
            let id = ObjectIdentifier(type)
            drinkStockLabels[index].text = "\(allDrinks[id]?.count ?? 0)개"
        }
    }
    
    func updateRemainCoinsLabel() {
        let remainCoins = vm.checkRemainCoins()
        remainCoinsLabel.text = "\(remainCoins)원"
    }
    
    // MARK: IBActions
    @objc func addDrinkStock(_ sender: UIButton) {
        guard let type = buttonsForDrinkStock[sender], let drink = DrinkFactory.createDrink(for: type) else {
            return
        }
        vm.addStock(for: drink)
    }
    
    @objc func charge(_ sender: UIButton) {
        guard let chargeAmount = buttonsForCharge[sender] else {
            return
        }
        vm.charge(coins: chargeAmount)
    }
    
    @objc func purchase(_ sender: UIButton) {
        guard let drink = buttonsForPurchase[sender] else {
            return
        }
        vm.purchase(drink: drink)
    }
}
