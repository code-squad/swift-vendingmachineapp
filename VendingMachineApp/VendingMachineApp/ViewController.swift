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
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshStock()
    }
    
    private func refreshStock() {
        if let stockList = vendingMachine.stockList() {
            for index in 0..<stockList.count {
                beverageStock[index].text = "\(stockList[index].count)개"
            }
        }
    }
    
    private func addStock(target: Product) {
        let adminMode = AdminMode(with: vendingMachine)
        do {
            _ = try adminMode.selectMenu(with: MenuAdmin.addStock, target: target.rawValue + 1, amount: 1)
        } catch let error as Errorable {
            print(error)
        } catch {
            print(error)
        }
        refreshStock()
    }

}
