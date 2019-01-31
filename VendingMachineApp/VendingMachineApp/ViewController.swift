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
    }
}

extension NSNotification.Name {
    static let stockChanged = NSNotification.Name(rawValue: "stockChanged")
    static let coinChanged = NSNotification.Name(rawValue: "coinChanged")
    static let historyChanged = NSNotification.Name(rawValue: "historyChanged")
}

class ViewController: UIViewController {
    var userMode: UserAvailableMode?
    
    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet var drinkLabels: [UILabel]!
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
        initialPuschaseImage()
        initialLabel()
        initialBuyButtonTag()
        initialInserButtonTag()
    }
    
    func set(vending: UserAvailableMode) {
        userMode = vending
    }
    
    @objc func updateDrinkLabel() {
        for menu in DrinkCategory.allCases {
            userMode?.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu.rawValue-1].text = "\(drinkCounts)개"
            }
        }
    }
    
    @objc func updateCoinLabel() {
        userMode?.markCoinLabel { coin in
            self.currentCoin.text = "잔액: \(coin)원"
        }
    }
    
    @objc func updatePurchaseHistory() {
        userMode?.markPurchasedHistory { history in
            let purchasedView = createPurchasedDrinkView(drink: history[history.count-1], index: history.count-1)
            self.view.addSubview(purchasedView)
        }
    }
    
    private func initialPuschaseImage() {
        userMode?.markPurchasedHistory { history in
            var purchasedView: UIImageView
            for index in 0..<history.count {
                purchasedView = createPurchasedDrinkView(drink: history[index], index: index)
                self.view.addSubview(purchasedView)
            }
        }
    }
    
    private func createPurchasedDrinkView(drink: Beverage, index: Int) -> UIImageView {
        let initialX = 40
        let initialY = 630
        let tempImage = UIImageView(image: UIImage(named: drink.convertToImageName()))
        tempImage.frame = CGRect(x: initialX + index*50, y: initialY, width: 140, height: 100)
        tempImage.contentMode = .scaleAspectFit
        return tempImage
    }
    
    private func initialImage() {
        for image in drinkImages { image.setCornerRadius() }
        for image in drinkImages { image.layer.borderWidth = 5 }
    }
    
    private func initialLabel() {
        for menu in DrinkCategory.allCases {
            userMode?.markDrinkLabel(menu) { drinkCounts in
                self.drinkLabels[menu.rawValue-1].text = "\(drinkCounts)개"
            }
        }
        userMode?.markCoinLabel { coin in
            self.currentCoin.text = "잔약 : \(coin)원"
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
        userMode?.insert(coin: coin)
    }
    
    @IBAction func buyDrink(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let menu = DrinkCategory(rawValue: button.tag) else { return }
        let buyState = userMode?.isAbleToPick(menu: menu)
        if buyState == .success {
            userMode?.pick(menu: menu)
        } else {
            let warningMessage = UIAlertController(title: "실패", message: buyState?.convertString(), preferredStyle: .alert)
            let cancelWindow = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            warningMessage.addAction(cancelWindow)
            present(warningMessage, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Translation" {
            let managerViewController = segue.destination as? SecondViewController
            managerViewController?.set(vending: userMode as! VendingMachine)
        }
    }
}


