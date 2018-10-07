//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vendingMachine = VendingMachine(with: Stock.prepareStock())
    
    @IBAction func addStrawBerryMilkBtn(_ sender: UIButton) {
        addStock(target: Product.organicStrawberryMilk)
    }
    @IBAction func addChocolateMilkBtn(_ sender: UIButton) {
        addStock(target: Product.seoulChocoMilk)
    }
    @IBAction func addBananaMilkBtn(_ sender: UIButton) {
        addStock(target: Product.bananasAreNaturallyWhite)
    }
    @IBAction func addCokeBtn(_ sender: UIButton) {
        addStock(target: Product.dietCoke)
    }
    @IBAction func addCiderBtn(_ sender: UIButton) {
        addStock(target: Product.chilsungCider)
    }
    @IBAction func addFantaBtn(_ sender: UIButton) {
        addStock(target: Product.orangeFanta)
    }
    @IBAction func addTopCoffeeBtn(_ sender: UIButton) {
        addStock(target: Product.topCoffee)
    }
    @IBAction func addCantataCoffeeBtn(_ sender: UIButton) {
        addStock(target: Product.cantataCoffee)
    }
    @IBAction func addGeorgiaCoffeeBtn(_ sender: UIButton) {
        addStock(target: Product.georgiaCoffee)
    }
    @IBAction func addBalance1000(_ sender: UIButton) {
        addBalance(cash: CashUnit.thousand)
    }
    @IBAction func addBalance5000(_ sender: UIButton) {
        addBalance(cash: CashUnit.fiveThousand)
    }
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var statusMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshStock()
        roundEdgeOfImage()
    }
    
    private func refreshStock() {
        if let stockList = vendingMachine.stockList() {
            for index in 0..<stockList.count {
                self.beverageStock[index].text = "\(stockList[index].count)개"
            }
        }
    }
    
    private func refreshBalance() {
        let balance = vendingMachine.presentBalance()
        self.balance.text = "\(balance)원"
    }
    
    private func addStock(target: Product) {
        let adminMode = AdminMode(with: vendingMachine)
        do {
            _ = try adminMode.selectMenu(with: MenuAdmin.addStock, target: target.rawValue + 1, amount: 1)
        } catch let error as Errorable {
            outputErrorMessage(error: error)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
        refreshStock()
    }
    
    private func addBalance(cash: CashUnit) {
        let userMode = UserMode(with: vendingMachine)
        
        do {
            _ = try userMode.selectMenu(with: Menu.addBalance, value: cash.rawValue)
        } catch let error as Errorable {
            outputErrorMessage(error: error)
        } catch {
            outputErrorMessage(error: error as? Errorable ?? InputError.unknown)
        }
        refreshBalance()
    }
    
    private func outputErrorMessage(error: Errorable) {
        self.statusMessage.text  = error.description
    }
    
    private func roundEdgeOfImage() {
        for image in self.beverageImages {
            image.layer.cornerRadius = 10.0
        }
    }

}
