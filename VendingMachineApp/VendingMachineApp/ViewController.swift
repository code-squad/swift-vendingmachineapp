//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    let outputView = OutputView()
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine.initialStock(howMany :3)
        let stockList = vendingMachine.showStock()
        
        outputView.setting(with: stockList)
        self.view = outputView
    }


}

