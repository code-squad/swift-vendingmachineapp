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
    
    var vendingMachine: VendingMachineUseable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        refreshDrinkCount()
        refreshBalance()
        addSubViewToSellDrinkList()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshStock(_:)), name: .refreshStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshBalance(_:)), name: .refreshBalance, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onRefreshSellDrink(_:)), name: .refreshSellDrink, object: nil)
    }
    
    private func refreshDrinkCount () {
        vendingMachine.printStock(handler:
            { drinkMenu, count in
                counts[drinkMenu.rawValue]?.text = String(count)+KoreanUnit.count.rawValue
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToAdmin" {
            let destination = segue.destination as! AdminViewController
            destination.referToVendingMachineManagementable(self.vendingMachine as! VendingMachineManagementable)
        }
    }
    
    private func refreshBalance () {
        vendingMachine.printBalance(handler:
            { balance in
                self.balance.text = "\(balance)"+KoreanUnit.won.rawValue
        })
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
       refreshDrinkCount()
    }
    
    @objc func onRefreshBalance(_ notification:Notification) {
        refreshBalance()
    }
    
    @objc func onRefreshSellList(_ notification:Notification) {
        addSubViewToSellDrink()
    }
    
    @objc func onRefreshSellDrink(_ notification:Notification) {
        addSubViewToSellDrink()
    }
    
    private func addSubViewToSellDrink () {
        vendingMachine.printSellDrink(handler: addSubView)
    }
    
    private func addSubViewToSellDrinkList () {
        vendingMachine.printSellDrinkList(handler: addSubView)
    }
    
    private func addSubView (count: Int, drinkMenu: DrinkMenu) {
        let xCoordinate = ((count-1)*50)+40
    
        let image = UIImage(named: drinkMenu.getName()+".jpg")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: xCoordinate, y: 575, width: 100, height: 100)
        self.view.addSubview(imageView)
    }
}
