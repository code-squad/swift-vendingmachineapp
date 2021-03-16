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
    private var chargeAmount = ChargeUnit.allCases
    private let drinkType = [BananaMilk.self, Cantata.self, Fanta.self]
    private var buttonsForDrink: [UIButton: Drink.Type] = [:]
    private var buttonsForCharge: [UIButton: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: .updatedDrinkStock, object: nil, queue: .main) { [weak self] _ in
            self?.updateDrinkStockLabels()
        }
        NotificationCenter.default.addObserver(forName: .updatedRemainCoins, object: nil, queue: .main) { [weak self] _ in
            self?.updateRemainCoinsLabel()
        }
        
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
            buttonsForCharge[$1] = chargeAmount[$0].rawValue
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
        appDelegate.vendingMachine?.addStock(for: drink)
        NotificationCenter.default.post(name: .updatedDrinkStock, object: self, userInfo: nil)
    }
    
    @objc func charge(_ sender: UIButton) {
        guard let chargeAmount = buttonsForCharge[sender], let vm = appDelegate.vendingMachine else {
            return
        }
        vm.charge(coins: chargeAmount)
        NotificationCenter.default.post(name: .updatedRemainCoins, object: self, userInfo: nil)
    }
}

extension NSNotification.Name {
    static let updatedDrinkStock = Notification.Name("updatedDrinkStock")
    static let updatedRemainCoins = Notification.Name("updatedRemainCoins")
}
