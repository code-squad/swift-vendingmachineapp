//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 15/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var machine: VendingMachine = VendingMachine()
    var drinkImages: [UIImageView?] = []
    var eachDrinkLabel: [UILabel?] = []
    
    @IBOutlet weak var bananaMilkImage: UIImageView?
    @IBOutlet weak var chocoMilkImage: UIImageView?
    @IBOutlet weak var colaImage: UIImageView?
    @IBOutlet weak var fantaImage: UIImageView?
    @IBOutlet weak var cantataImage: UIImageView?
    @IBOutlet weak var topImage: UIImageView?
    @IBOutlet weak var bananaLabel: UILabel?
    @IBOutlet weak var chocoLabel: UILabel?
    @IBOutlet weak var colaLabel: UILabel?
    @IBOutlet weak var fantaLabel: UILabel?
    @IBOutlet weak var cantataLabel: UILabel?
    @IBOutlet weak var topLabel: UILabel?
    @IBOutlet weak var currentCoin: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drinkImages.append(bananaMilkImage)
        drinkImages.append(chocoMilkImage)
        drinkImages.append(colaImage)
        drinkImages.append(fantaImage)
        drinkImages.append(cantataImage)
        drinkImages.append(topImage)
        eachDrinkLabel.append(bananaLabel)
        eachDrinkLabel.append(chocoLabel)
        eachDrinkLabel.append(colaLabel)
        eachDrinkLabel.append(fantaLabel)
        eachDrinkLabel.append(cantataLabel)
        eachDrinkLabel.append(topLabel)
        currentCoin?.text = "잔액 : " + machine.currentCoinState() + "원"
        initialImage()
        initialLabel()
    }
    
    private func initialImage() {
        for image in drinkImages {
            image?.layer.cornerRadius = 30
            image?.clipsToBounds = true
        }
    }
    
    private func initialLabel() {
        let machine: AvailableCommonMachineFunction = self.machine
        var eachMenuNumber = 1
        for label in eachDrinkLabel {
            label?.text = "\(machine.getEachStockCount(menu: eachMenuNumber))개"
            eachMenuNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        drinkImages.removeAll()
        eachDrinkLabel.removeAll()
    }
    
    @IBAction func addBananaStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let bananaMilkMenu = 1
        if managerMode.isAbleToAdd(menu: bananaMilkMenu) == .success {
            machine.addStock(menu: bananaMilkMenu)
            bananaLabel?.text = "\(machine.getEachStockCount(menu: bananaMilkMenu))개"
        }
    }
    
    @IBAction func addChocoStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let chocoMilkMenu = 2
        if managerMode.isAbleToAdd(menu: chocoMilkMenu) == .success {
            machine.addStock(menu: chocoMilkMenu)
            chocoLabel?.text = "\(machine.getEachStockCount(menu: chocoMilkMenu))개"
        }
    }
    
    @IBAction func addColaStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let colaMenu = 3
        if managerMode.isAbleToAdd(menu: colaMenu) == .success {
            machine.addStock(menu: colaMenu)
            colaLabel?.text = "\(machine.getEachStockCount(menu: colaMenu))개"
        }
    }
    
    @IBAction func addFantaStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let fantaMenu = 4
        if managerMode.isAbleToAdd(menu: fantaMenu) == .success {
            machine.addStock(menu: fantaMenu)
            fantaLabel?.text = "\(machine.getEachStockCount(menu: fantaMenu))개"
        }
    }
    
    @IBAction func addCantataStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let cantataMenu = 5
        if managerMode.isAbleToAdd(menu: cantataMenu) == .success {
            machine.addStock(menu: cantataMenu)
            cantataLabel?.text = "\(machine.getEachStockCount(menu: cantataMenu))개"
        }
    }
    
    @IBAction func addTOPStock(_ sender: Any) {
        let managerMode: ManageableMode = machine
        let topMenu = 6
        if managerMode.isAbleToAdd(menu: topMenu) == .success {
            machine.addStock(menu: topMenu)
            topLabel?.text = "\(machine.getEachStockCount(menu: topMenu))개"
        }
    }
    
    @IBAction func insertThousandCoin(_ sender: Any) {
        let userMode: UserAvailableMode = machine
        userMode.insert(coin: 1000)
        currentCoin?.text = "잔액 : " + machine.currentCoinState() + "원"
    }
    
    @IBAction func insertFiveThousandCoin(_ sender: Any) {
        let userMode: UserAvailableMode = machine
        userMode.insert(coin: 5000)
        currentCoin?.text = "잔액 : " + machine.currentCoinState() + "원"
    }
}




