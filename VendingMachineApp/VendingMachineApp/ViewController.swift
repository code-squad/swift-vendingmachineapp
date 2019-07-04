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
        
        refreshDrinkCount((vendingMachine))
        refreshBalance(vendingMachine)
        addSubViewToSellList(vendingMachine)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshSellList(_:)), name: .refreshSellList, object: nil)
        
        imageInit()
    }
    
    private func refreshDrinkCount (_ stock: StockPrintable) {
        stock.printStock(handler:
            { stock in
                for (index, count) in stock.enumerated() {
                    counts[index]?.text = String(count)+KoreanUnit.count.rawValue
                }
        })
    }
    
    private func refreshBalance (_ balance: BalancePrintable) {
        balance.printBalance(handler:
            { balance in
                self.balance.text = "\(balance)"+KoreanUnit.won.rawValue
        })
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
       refreshDrinkCount(vendingMachine)
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        refreshBalance(vendingMachine)
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
        let supplyableDrinkList = SupplyableDrinkList.getSupplyableDrinkList()
        
        if drink == supplyableDrinkList[0] {
            return "bananaMilk.jpg"
        }
        if drink == supplyableDrinkList[1] {
            return "strawberryMilk.jpg"
        }
        if drink == supplyableDrinkList[2] {
            return "fanta.jpg"
        }
        if drink == supplyableDrinkList[3] {
            return "top.jpg"
        }
        if drink == supplyableDrinkList[4] {
            return "hot6.jpg"
        }
        if drink == supplyableDrinkList[5] {
            return "pepsiCoke.jpg"
        }
        return "fanta.jpg"
    }
}
