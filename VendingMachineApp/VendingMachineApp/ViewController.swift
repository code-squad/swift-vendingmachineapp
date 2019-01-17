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
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
}

class ViewController: UIViewController {
    var machine: VendingMachine = VendingMachine()

    @IBOutlet var drinkImages: [UIImageView]!
    @IBOutlet var drinkLabels: [UILabel]!
    @IBOutlet weak var currentCoin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentCoin.text = "잔액 : " + machine.currentCoinState() + "원"
        initialImage()
        initialLabel()
    }
    
    private func initialImage() {
        for image in drinkImages { image.setCornerRadius() }
    }
    
    private func initialLabel() {
        let machine: AvailableCommonMachineFunction = self.machine
        var eachMenuNumber = 1
        for label in drinkLabels {
            label.text = "\(machine.getEachStockCount(menu: eachMenuNumber))개"
            eachMenuNumber += 1
        }
    }
    
    @IBAction func addBananaStock(_ sender: Any) {
        let bananaMilkMenu = 1
        setLabel(of: bananaMilkMenu)
    }
    
    @IBAction func addChocoStock(_ sender: Any) {
        let chocoMilkMenu = 2
        setLabel(of: chocoMilkMenu)
    }
    
    @IBAction func addColaStock(_ sender: Any) {
        let colaMenu = 3
        setLabel(of: colaMenu)
    }
    
    @IBAction func addFantaStock(_ sender: Any) {
        let fantaMenu = 4
        setLabel(of: fantaMenu)
    }
    
    @IBAction func addCantataStock(_ sender: Any) {
        let cantataMenu = 5
        setLabel(of: cantataMenu)
    }
    
    @IBAction func addTOPStock(_ sender: Any) {
        let topMenu = 6
        setLabel(of: topMenu)
    }
    
    private func setLabel(of menu: Int) {
        let managerMode: ManageableMode = machine
        if managerMode.isAbleToAdd(menu: menu) == .success {
            machine.addStock(menu: menu)
            drinkLabels[menu-1].text = "\(machine.getEachStockCount(menu: menu))개"
        }
    }
    
    @IBAction func insertThousandCoin(_ sender: Any) {
        setInserState(coin: 1000)
    }
    
    @IBAction func insertFiveThousandCoin(_ sender: Any) {
        setInserState(coin: 5000)
    }
    
    private func setInserState(coin: Int) {
        let userMode: UserAvailableMode = machine
        userMode.insert(coin: coin)
        currentCoin.text = "잔액 : " + machine.currentCoinState() + "원"
    }
}




