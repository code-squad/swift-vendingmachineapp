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
        
        let stock = vendingMachine.printStock()
        refreshDrinkCount(stock)
        let balance = vendingMachine.printBalance()
        refreshBalance(balance)
        
        addSubViewToSellList(vendingMachine)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshSellList(_:)), name: .refreshSellList, object: nil)
        
        imageInit()
    }
    
    private func refreshDrinkCount (_ stock: [Int]) {
        for (index, count) in stock.enumerated() {
            counts[index]?.text = String(count)+KoreanUnit.count.rawValue
        }
    }
    
    private func refreshBalance (_ balance: Money) {
        self.balance.text = "\(balance)"+KoreanUnit.won.rawValue
    }
    
    /// 이미지 Border, Round 변경
    private func imageInit () {
        for image in images {
            image?.layer.cornerRadius = 15
        }
    }

    @IBAction func drinkSupply(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 5 {
            vendingMachine.supply(sender.tag, amount: 1)
        }
    }
    
    @IBAction func insertCoin(_ sender: UIButton) {
        vendingMachine.insertCoin(sender.tag)
    }
    
    @IBAction func buy(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 5 {
            do {
                try vendingMachine.buyToIndex(sender.tag)
            }
            catch let error as BuyError
            {
                print(error.localizedDescription)
            }
            catch {
                print("안알려진 오류입니다")
            }
        }
    }
    
    @objc func onRefreshStock(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let stock = userInfo["stock"] as! [Int]
        
        refreshDrinkCount(stock)
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        guard let userInfo = notification.userInfo else { return }
        let balance = userInfo["balance"] as! Money
        
        refreshBalance(balance)
    }
    
    @objc func onRefreshSellList(_ notification:Notification) {
        addSubViewToSellList(vendingMachine)
    }
    
    private func addSubViewToSellList (_ sellList: SellListPrintable) {
        var xCoordinate = 40
        
        sellList.printSellList(handler:
            { sellList in
                for drink in sellList {
                    let imageName = drinkToImageName(drink)
                    let image1 = UIImage(named: imageName)
                    let iv1 = UIImageView(image: image1!)
                    iv1.frame = CGRect(x: xCoordinate, y: 575, width: 100, height: 100)
                    self.view.addSubview(iv1)
                    
                    xCoordinate += 50
                }
        })
    }
    
    private func drinkToImageName (_ drink: Drink) -> String {
        if drink is BananaMilk {
            return "bananaMilk.jpg"
        }
        if drink is StrawberryMilk {
            return "strawberryMilk.jpg"
        }
        if drink is Fanta {
            return "fanta.jpg"
        }
        if drink is TOP {
            return "top.jpg"
        }
        if drink is Hot6 {
            return "hot6.jpg"
        }
        if drink is PepsiCoke {
            return "pepsiCoke.jpg"
        }
        return "fanta.jpg"
    }
}
