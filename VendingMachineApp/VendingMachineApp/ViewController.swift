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
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.layer.borderWidth = 5
    }
}

extension NSNotification.Name {
    static let stockChanged = NSNotification.Name(rawValue: "stockChanged")
    static let coinChanged = NSNotification.Name(rawValue: "coinChanged")
    static let historyChanged = NSNotification.Name(rawValue: "historyChanged")
}

class ViewController: UIViewController {    
    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet var drinkLabels: [UILabel]!
    @IBOutlet var addButtons: [UIButton]!
    @IBOutlet var insertButtons: [UIButton]!
    @IBOutlet var buyButtons: [UIButton]!
    @IBOutlet weak var currentCoin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateDrinkLabel), name: .stockChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCoinLabel), name: .coinChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchaseHistory), name: .historyChanged, object: nil)
        initialImage()
        initialLabel()
        initialAddButtonTag()
        initialBuyButtonTag()
        initialInserButtonTag()
    }
    
    @objc func updateDrinkLabel() {
        let commonMode: CommonAvailableMachine = VendingMachine.sharedInstance
        for menu in DrinkCategory.allCases {
            commonMode.markDrinkLabel(menu.rawValue) { drinkCounts in
                self.drinkLabels[menu.rawValue-1].text = "\(drinkCounts)개"
            }
        }
    }
    
    @objc func updateCoinLabel() {
        let commonMode: CommonAvailableMachine = VendingMachine.sharedInstance
        commonMode.markCoinLabel { coin in
            self.currentCoin.text = "잔액 : \(coin)원"
        }
    }
    
    @objc func updatePurchaseHistory() {
        let commonMode: CommonAvailableMachine = VendingMachine.sharedInstance
        commonMode.markPurchasedHistory { history in
            var initialX = 40
            let initialY = 575
            var eachImage: UIImageView
            for each in history {
                eachImage = UIImageView(image: UIImage(named: each.convertToImageName()))
                eachImage.frame = CGRect(x: initialX, y: initialY, width: 140, height: 100)
                eachImage.contentMode = .scaleAspectFit
                initialX += 50
                self.view.addSubview(eachImage)
            }
        }
    }
    
    private func initialImage() {
        for image in drinkImages { image.setCornerRadius() }
    }
    
    private func initialLabel() {
        let menuCount = 6
        let machine: CommonAvailableMachine = VendingMachine.sharedInstance
        for menu in 1...menuCount {
            machine.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu-1].text = "\(drinkCounts)개"
            }
        }
        machine.markCoinLabel { coin in
            self.currentCoin.text = "잔액 : \(coin)원"
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
    
    private func initialBuyButtonTag() {
        var tag = 1
        for button in buyButtons {
            button.tag = tag
            tag += 1
        }
    }
    
    @IBAction func addStock(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let menu = DrinkCategory(rawValue: button.tag) else { return }
        addEachDrink(of: menu.rawValue)
    }
    
    private func addEachDrink(of menu: Int) {
        let managerMode: ManageableMode = VendingMachine.sharedInstance
        if managerMode.isAbleToAdd(menu: menu) == .success {
            managerMode.addStock(menu: menu)
        }
    }
    
    @IBAction func insertCoin(_ sender: Any) {
        enum InsertCoin: Int {
            case oneThousand = 1000
            case fiveThousand = 5000
        }
        
        let coin: InsertCoin
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 1: coin = .oneThousand
        case 2: coin = .fiveThousand
        default: return
        }
        insertEach(coin.rawValue)
    }
    
    private func insertEach(_ coin: Int) {
        let userMode: UserAvailableMode = VendingMachine.sharedInstance
        userMode.insert(coin: coin)
    }
    
    @IBAction func buyDrink(_ sender: Any) {
        let userMode: UserAvailableMode = VendingMachine.sharedInstance
        guard let button = sender as? UIButton else { return }
        guard let menu = DrinkCategory(rawValue: button.tag) else { return }
        let buyState = userMode.isAbleToPick(menu: menu.rawValue)
        if buyState == .success {
            userMode.pick(menu: menu.rawValue)
        } else {
            let warningMessage = UIAlertController(title: "실패", message: buyState.convertString(), preferredStyle: .alert)
            let cancelWindow = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            warningMessage.addAction(cancelWindow)
            present(warningMessage, animated: true, completion: nil)
        }
    }
}


