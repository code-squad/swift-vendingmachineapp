//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 6/25/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bananaMilkCount: UILabel!
    @IBOutlet weak var strawberryMilkCount: UILabel!
    @IBOutlet weak var fantaCount: UILabel!
    @IBOutlet weak var topCount: UILabel!
    @IBOutlet weak var hot6Count: UILabel!
    @IBOutlet weak var pepsiCokeCount: UILabel!
    @IBOutlet weak var balance: UILabel!
    lazy var counts = [bananaMilkCount, strawberryMilkCount, fantaCount, topCount, hot6Count, pepsiCokeCount]
    @IBOutlet weak var bananaMilkImage: UIImageView!
    @IBOutlet weak var strawberryMilkImage: UIImageView!
    @IBOutlet weak var fantaImage: UIImageView!
    @IBOutlet weak var topCoffeImage: UIImageView!
    @IBOutlet weak var hot6Image: UIImageView!
    @IBOutlet weak var pepsiCokeImage: UIImageView!
    lazy var images = [bananaMilkImage, strawberryMilkImage, fantaImage, topCoffeImage, hot6Image, pepsiCokeImage]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vendingMachine = appDelegate.vendingMachine
        
        refreshDrinkCount(vendingMachine)
        refreshBalance(vendingMachine)
        addSubViewToSellList(vendingMachine)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshSellList(_:)), name: .refreshSellList, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshSellDrink(_:)), name: .refreshSellDrink, object: nil)
    }
    
    private func refreshDrinkCount (_ stock: StockPrintable) {
        stock.printStock(handler:
            { drinkMenu, count in
                counts[drinkMenu.rawValue]?.text = String(count)+KoreanUnit.count.rawValue
        })
    }
    
    private func refreshBalance (_ balance: BalancePrintable) {
        balance.printBalance(handler:
            { balance in
                self.balance.text = "\(balance)"+KoreanUnit.won.rawValue
        })
    }

    @IBAction func drinkSupply(_ sender: UIButton) {
        let drinkMenu = DrinkMenu(rawValue: sender.tag)
        
        if let drinkMenu = drinkMenu {
            vendingMachine.supply(drinkMenu, amount: 1)
        }
    }
    
    @IBAction func insertCoin(_ sender: UIButton) {
        vendingMachine.insertCoin(sender.tag)
    }
    
    @IBAction func buy(_ sender: UIButton) {
        guard let drinkMenu = DrinkMenu(rawValue: sender.tag) else {
            return
        }
        do {
            try vendingMachine.buyToDrinkMenu(drinkMenu)
        }
        catch let error as BuyError
        {
            let alert = UIAlertController(title: "오류", message: error.localizedDescription, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "닫기", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        catch {
            
        }
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
       refreshDrinkCount(vendingMachine)
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        refreshBalance(vendingMachine)
    }
    
    @objc func onRefreshSellList(_ notification:Notification) {
        addSubViewToSellList(vendingMachine)
    }
    
    @objc func onRefreshSellDrink(_ notification:Notification) {
        addSubViewToSellDrink(vendingMachine)
    }
    
    private func addSubViewToSellList (_ sellList: SellListPrintable) {
        var xCoordinate = 40
        
        sellList.printSellList(handler:
            { drinkMenu in
                    let image = UIImage(named: drinkMenu.getImageName())
                    let imageView = UIImageView(image: image!)
                    imageView.frame = CGRect(x: xCoordinate, y: 575, width: 100, height: 100)
                    self.view.addSubview(imageView)

                    xCoordinate += 50
        })
    }
    
    private func addSubViewToSellDrink (_ sellDrink: SellDrinkPrintable) {
        var xCoordinate = 40
        
        sellDrink.printSellDrink(handler:
            { count, drinkMenu in
                xCoordinate += (count-1)*50
                
                let image = UIImage(named: drinkMenu.getImageName())
                let imageView = UIImageView(image: image!)
                imageView.frame = CGRect(x: xCoordinate, y: 575, width: 100, height: 100)
                self.view.addSubview(imageView)
        })
    }
}
